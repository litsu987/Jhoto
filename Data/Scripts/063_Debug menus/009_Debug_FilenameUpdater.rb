#===============================================================================
#
#===============================================================================
module FilenameUpdater
  module_function

  def readDirectoryFiles(directory, formats)
    files = []
    Dir.chdir(directory) do
      formats.each do |format|
        Dir.glob(format) { |f| files.push(f) }
      end
    end
    return files
  end

  def rename_berry_plant_charsets
    src_dir = "Graphics/Characters/"
    return false if !FileTest.directory?(src_dir)
    Console.echo_li(_INTL("Renombrando charsets de árboles de bayas..."))
    ret = false
    # generates a list of all graphic files
    files = readDirectoryFiles(src_dir, ["berrytree*.png"])
    # starts automatic renaming
    files.each_with_index do |file, i|
      next if file[/^berrytree_/]
      next if ["berrytreewet", "berrytreedamp", "berrytreedry", "berrytreeplanted"].include?(file.split(".")[0])
      new_file = file.gsub("berrytree", "berrytree_")
      File.move(src_dir + file, src_dir + new_file)
      ret = true
    end
    Console.echo_done(true)
    return ret
  end

  def update_berry_tree_event_charsets
    ret = []
    mapData = Compiler::MapData.new
    t = System.uptime
    Graphics.update
    Console.echo_li(_INTL("Revisando {1} mapas en busca de charsets de árboles de bayas...", mapData.mapinfos.keys.length))
    idx = 0
    mapData.mapinfos.keys.sort.each do |id|
      echo "." if idx % 20 == 0
      idx += 1
      Graphics.update if idx % 250 == 0
      map = mapData.getMap(id)
      next if !map || !mapData.mapinfos[id]
      changed = false
      map.events.each_key do |key|
        if System.uptime - t >= 5
          t += 5
          Graphics.update
        end
        map.events[key].pages.each do |page|
          next if nil_or_empty?(page.graphic.character_name)
          char_name = page.graphic.character_name
          next if !char_name[/^berrytree[^_]+/]
          next if ["berrytreewet", "berrytreedamp", "berrytreedry", "berrytreeplanted"].include?(char_name.split(".")[0])
          new_file = page.graphic.character_name.gsub("berrytree", "berrytree_")
          page.graphic.character_name = new_file
          changed = true
        end
      end
      next if !changed
      mapData.saveMap(id)
      ret.push(_INTL("Mapa {1}: '{2}' se ha modificado y guardado.", id, mapData.mapinfos[id].name))
    end
    Console.echo_done(true)
    return ret
  end

  def rename_files
    Console.echo_h1(_INTL("Actualizando nombres de archivos y localizaciones"))
    change_record = []
    # Add underscore to berry plant charsets
    if rename_berry_plant_charsets
      Console.echo_warn(_INTL("Los archivos del charset de los árboles de bayas se han renombrado."))
    end
    change_record += update_berry_tree_event_charsets
    # Warn if any map data has been changed
    if !change_record.empty?
      change_record.each { |msg| Console.echo_warn(msg) }
      Console.echo_warn(_INTL("Los datos de RMXP se han alterado. Cierra RMXP ahora para asegurarte de que los cambios se apliquen."))
    end
    echoln ""
    Console.echo_h2(_INTL("Se ha terminado de actualizar los nombres de archivos y localizaciones"), text: :green)
  end
end


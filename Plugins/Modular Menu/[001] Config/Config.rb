#-------------------------------------------------------------------------------
#  Your own entries for the pause menu
#
#  To add a new menu entry to the list, register a function block with:
#
#  ModularMenu.add_entry(:NAME, "button text", "icon name") do |menu|
#    # code you want to run
#    # when the entry in the menu is selected
#  end
#
#  To add a condition whether or not the menu entry should appear,
#  register a condition with:
#
#  ModularMenu.add_condition(:NAME) { next (conditional statement here) }
#-------------------------------------------------------------------------------
#  PokeDex
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:POKEDEX, _INTL("Pokédex"), "menuPokedex") do |menu|
  if Settings::USE_CURRENT_REGION_DEX
    pbFadeOutIn(99999){
      scene = PokemonPokedex_Scene.new
      screen = PokemonPokedexScreen.new(scene)
      screen.pbStartScreen
      menu.refresh
    }
  else
    if $player.pokedex.accessible_dexes.length == 1
      $PokemonGlobal.pokedexDex = $player.pokedex.accessible_dexes[0]
      pbFadeOutIn(99999) {
        scene = PokemonPokedex_Scene.new
        screen = PokemonPokedexScreen.new(scene)
        screen.pbStartScreen
        menu.refresh
      }
    else
      pbFadeOutIn(99999) {
        scene = PokemonPokedexMenu_Scene.new
        screen = PokemonPokedexMenuScreen.new(scene)
        screen.pbStartScreen
        menu.refresh
      }
    end
  end
end
# condition to satisfy
ModularMenu.add_condition(:POKEDEX) { next $player.pokedex && $player.pokedex.accessible_dexes.length > 0 }
#-------------------------------------------------------------------------------
#  Party Screen
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:POKEMON, _INTL("Pokémon"), "menuPokemon") do |menu|
  sscene = PokemonParty_Scene.new
  sscreen = PokemonPartyScreen.new(sscene,$player.party)
  hiddenmove = nil
  pbFadeOutIn(99999) {
    hiddenmove = sscreen.pbPokemonScreen
    if hiddenmove
      menu.pbEndScene
      menu.endscene = false
    end
  }
  if hiddenmove
    Kernel.pbUseHiddenMove(hiddenmove[0],hiddenmove[1])
    menu.close = true
  end
end
# condition to satisfy
ModularMenu.add_condition(:POKEMON) { next $player.party.length > 0 }
#-------------------------------------------------------------------------------
#  Bag Screen
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:BAG, _INTL("Mochila"), "menuBag") do |menu|
  item = 0
  scene = PokemonBag_Scene.new
  screen = PokemonBagScreen.new(scene,$bag)
  pbFadeOutIn(99999) {
    item = screen.pbStartScreen
    if item
      menu.pbEndScene
      menu.endscene = false
    end
  }
  if item
    Kernel.pbUseKeyItemInField(item)
    menu.close = true
  end
end
#-------------------------------------------------------------------------------
#  PokeGear
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:POKEGEAR, _INTL("Pokégear"), "menuPokegear") do |menu|
  scene = PokemonPokegear_Scene.new
  screen = PokemonPokegearScreen.new(scene)
  pbFadeOutIn(99999) {
    screen.pbStartScreen
  }
end
# condition to satisfy
ModularMenu.add_condition(:POKEGEAR) { next $player.has_pokegear }





#-------------------------------------------------------------------------------
#  RADAR
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:POKERADAR, _INTL("Radar"), "menuRadar") do |menu|
    pbPlayDecisionSE
    pbFadeOutIn {
      scene = EncounterList_Scene.new
      screen = EncounterList_Screen.new(scene)
      screen.pbStartScreen
      menu.pbRefresh
  }
end
# condition to satisfy
ModularMenu.add_condition(:RADAR) { next $player.has_pokegear }




#-------------------------------------------------------------------------------
#  MEDALLAS
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:BADGES, _INTL("Medallas"), "menuBadges") do |menu|
    pbPlayDecisionSE
    pbFadeOutIn {
      scene = BadgeCase_Scene.new
      screen = BadgeCaseScreen.new(scene)
      screen.pbStartScreen
      menu.pbRefresh
  }
end






#-------------------------------------------------------------------------------
#  Save Screen
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:SAVE, _INTL("Guardar"), "menuSave") do |menu|
  scene = PokemonSave_Scene.new
  screen = PokemonSaveScreen.new(scene)
  menu.pbEndScene
  menu.endscene = false
  if screen.pbSaveScreen
    menu.close = true
  else
    menu.pbStartScene
    menu.pbShowMenu
    menu.close = false
  end
end
# condition to satisfy
ModularMenu.add_condition(:SAVE) { next !$game_system || !$game_system.save_disabled && !(pbInSafari? || pbInBugContest?) }
#-------------------------------------------------------------------------------
#  Quit Safari-Zone
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:QUIT, _INTL("\\CONTEST"), "menuQuit") do |menu|
  if pbInSafari?
    if Kernel.pbConfirmMessage(_INTL("Would you like to leave the Safari Game right now?"))
      menu.pbEndScene
      menu.endscene = false
      menu.close = true
      pbSafariState.decision = 1
      pbSafariState.pbGoToStart
    end
  else
    if Kernel.pbConfirmMessage(_INTL("Would you like to end the Contest now?"))
      menu.pbEndScene
      menu.endscene = false
      menu.close = true
      pbBugContestState.pbStartJudging
      next
    end
  end
end
# condition to satisfy
ModularMenu.add_condition(:QUIT) { next pbInSafari? || pbInBugContest? }
#-------------------------------------------------------------------------------
#  Options Screen
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:OPTIONS, _INTL("Opciones"), "menuOptions") do |menu|
  scene = PokemonOption_Scene.new
  screen = PokemonOptionScreen.new(scene)
  pbFadeOutIn(99999) {
    screen.pbStartScreen
    pbUpdateSceneMap
  }
end
#-------------------------------------------------------------------------------
#  Debug Menu
#-------------------------------------------------------------------------------
ModularMenu.add_entry(:DEBUG, _INTL("Debug"), "menuDebug") do |menu|
  pbFadeOutIn(99999) {
    pbDebugMenu
    menu.refresh
  }
end
# condition to satisfy
ModularMenu.add_condition(:DEBUG) { next $DEBUG }




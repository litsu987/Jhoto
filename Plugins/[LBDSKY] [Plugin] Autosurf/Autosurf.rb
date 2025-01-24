#############################################################
#                          Autosurf                         #
#                       Autor : Bezier                      #
#                 Adaptado a la 21.1 por Neme               #
#               Compatible con Essentials 21.1              #
#                                                           #
# Este script plug&play permite surfear de forma automática #
# cuando se entra en contacto con un terrain tag surfeable  #
#############################################################
 
# Poner a true si Surf se activa con las medallas
AUTOSURF_USEBADGES = false
 
# Poner a true si Surf se activa con un objeto
AUTOSURF_USEITEM = false

# Objeto que permite hacer autosurf
AUTOSURF_ITEM_KEY = :POKEMONTURA
 
def pbAutoSurf
  x = $game_player.x
  y = $game_player.y
  currentTag = $game_map.terrain_tag(x,y)
  facingTag = pbFacingTerrainTag
  
  if !$PokemonGlobal.surfing && $game_player.pbFacingTerrainTag.can_surf
 
    # Cancela el Surf si está activo por medallas y no se cumple la condición para surf
    return if AUTOSURF_USEBADGES && !(Settings::FIELD_MOVES_COUNT_BADGES ? $player.badge_count >= Settings::BADGE_FOR_SURF : $player.badges[Settings::BADGE_FOR_SURF])

    # Cancela el Surf si está activo por objeto pero no se posee el objeto que permite surfear / Falta (hasConst?(PBItems,AUTOSURF_ITEM_KEY)
    return if AUTOSURF_USEITEM && !($bag.has?(AUTOSURF_ITEM_KEY) && $bag.quantity(AUTOSURF_ITEM_KEY)>0)
 
    pbStartSurfing
    return true
  end
  return false
end
 
# Redefine los movimientos del player para poder usar el autosurf
class Game_Player < Game_Character
  def move_generic(dir, turn_enabled = true)
    turn_generic(dir) if turn_enabled
    if can_move_in_direction?(dir)
      turn_generic(dir)
      @move_initial_x = @x
      @move_initial_y = @y
      @x += (dir == 4) ? -1 : (dir == 6) ? 1 : 0
      @y += (dir == 8) ? -1 : (dir == 2) ? 1 : 0
      @move_timer = 0.0
      increase_steps
    else
      check_event_trigger_touch(dir)
    end
  end
  
  def move_down(turn_enabled = true)
    if turn_enabled
      turn_down
    end
    if passable?(@x, @y, 2)
      return if pbEndSurf(0,1)
      move_generic(2, turn_enabled)
    elsif !pbAutoSurf 
      if !check_event_trigger_touch(2)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
  
  def move_left(turn_enabled = true)
    if turn_enabled
      turn_left
    end
    if passable?(@x, @y, 4)
      return if pbEndSurf(-1,0)
      move_generic(4, turn_enabled)
    elsif !pbAutoSurf
      if !check_event_trigger_touch(4)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
  
  def move_right(turn_enabled = true)
    if turn_enabled
      turn_right
    end
    if passable?(@x, @y, 6)
      return if pbEndSurf(1,0)
      move_generic(6, turn_enabled)
    elsif !pbAutoSurf
      if !check_event_trigger_touch(6)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
  
  def move_up(turn_enabled = true)
    if turn_enabled
      turn_up
    end
    if passable?(@x, @y, 8)
      return if pbEndSurf(0,-1)
      move_generic(8, turn_enabled)
    elsif !pbAutoSurf
      if !check_event_trigger_touch(8)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
end
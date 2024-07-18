#==============================================================================#
# SETTINGS DEL FOLLOW POKEMON                                                  #
#                                                                              #
# Aquí tienes toda la configuración personalizable del script de que te sigan  #
# los Pokémon.                                                                 #
#==============================================================================#

module FollowingPkmn
  # Evento común que contiene "FollowingPkmn.talk" en un comando de script
  # Cambia esto si deseas un evento común separado que se reproduzca al hablar con
  # el Pokémon que te sigue. De lo contrario, establece esto como nil.
  FOLLOWER_COMMON_EVENT     = nil 

  # IDs de animación del pokémon que te sigue.
  # Cambia esto si no estás utilizando las animaciones Animations.rxdata
  # proporcionadas en el script.
  ANIMATION_COME_OUT        = 30
  ANIMATION_COME_IN         = 29

  ANIMATION_EMOTE_HEART     = 9
  ANIMATION_EMOTE_MUSIC     = 12
  ANIMATION_EMOTE_HAPPY     = 10
  ANIMATION_EMOTE_ELIPSES   = 13
  ANIMATION_EMOTE_ANGRY     = 15
  ANIMATION_EMOTE_POISON    = 17

  # La tecla que el jugador debe presionar para alternar los Pokémon que te siguen. Establece esto como nil (nulo)
  # si deseas deshabilitar esta función. (:JUMPUP es la tecla A por defecto)
  TOGGLE_FOLLOWER_KEY       = :JUMPUP

  # Mostrar la opción para alternar los Pokémon que te siguen en la pantalla de Opciones.
  SHOW_TOGGLE_IN_OPTIONS    = true

  # La tecla que el jugador debe presionar para recorrer rápidamente su grupo de Pokémon. Establece esto como nil (nulo)
  # si deseas deshabilitar esta función.
  CYCLE_PARTY_KEY           = nil

  # Tonos de estado a utilizar, si esto es verdadero (Rojo, Verde, Azul)
  APPLY_STATUS_TONES        = true
  TONE_BURN                 = [206, 73, 43]
  TONE_POISON               = [109, 55, 130]
  TONE_PARALYSIS            = [204, 152, 44]
  TONE_FROZEN               = [56, 160, 193]
  TONE_SLEEP                = [0, 0, 0]
  # Para tus condiciones de estado personalizadas, simplemente agrégalo como 
  # "TONE_(NOMBRE INTERNO)"
  # Ejemplo: TONE_SANGRADO, TONE_CONFUSIÓN, TONE_ENAMORAMIENTO


  # Tiempo necesario para que la amistad del Pokémon que te sigue aumente cuando
  # está primero en el grupo (en segundos)
  FRIENDSHIP_TIME_TAKEN     = 125

  # Elige si el Pokémon que te sigue puede encontrarse o no objetos al caminar
  # contigo.
  CAN_FIND_ITEMS = true

  # Tiempo necesario para que el Pokémon que te sigue encuentre un objeto 
  # cuando está primero en el grupo (en segundos). Si la opción anterior está
  # en false, nunca encontrará nada.
  ITEM_TIME_TAKEN           = 375

  # Si el Pokémon que te sigue siempre permanece en su ciclo de movimientos 
  # (como en HGSS) o no.
  ALWAYS_ANIMATE            = true

  # Si el Pokémon que te sigue siempre mira hacia el jugador o no, como en HGSS.
  ALWAYS_FACE_PLAYER        = false

  # Si otros eventos pueden atravesar al Pokémon que te sigue o no.
  IMPASSABLE_FOLLOWER       = false

  # Si el Pokémon que te sigue se desliza en la batalla en lugar de ser enviado
  # en una Pokébola. (Esto no afecta a EBDX, lee la documentación de EBDX para
  # cambiar esta característica en EBDX)
  SLIDE_INTO_BATTLE         = true

  # Mostrar la animación de apertura y cierre de la Pokébola cuando la Enfermera
  # Joy toma tus Poké Balls en el Centro Pokémon.
  SHOW_POKECENTER_ANIMATION = true

  # Lista de Pokémon clasificados como Pokémon que levitan, y que siempre 
  # aparecerán detrás del jugador al surfear.
  # No incluye ningún tipo volador o agua, ya que esos están gestionados de 
  # antemano.
  LEVITATING_FOLLOWERS = [
    # Gen 1
    :BEEDRILL, :VENOMOTH, :ABRA, :GEODUDE, :MAGNEMITE, :GASTLY, :HAUNTER,
    :KOFFING, :WEEZING, :PORYGON, :MEW,
    # Gen 2
    :MISDREAVUS, :UNOWN, :PORYGON2, :CELEBI,
    # Gen 3
    :DUSTOX, :SHEDINJA, :MEDITITE, :VOLBEAT, :ILLUMISE, :FLYGON, :LUNATONE,
    :SOLROCK, :BALTOY, :CLAYDOL, :CASTFORM, :SHUPPET, :DUSKULL, :CHIMECHO,
    :GLALIE, :BELDUM, :METANG, :LATIAS, :LATIOS, :JIRACHI,
    # Gen 4
    :MISMAGIUS, :BRONZOR, :BRONZONG, :SPIRITOMB, :CARNIVINE, :MAGNEZONE,
    :PORYGONZ, :PROBOPASS, :DUSKNOIR, :FROSLASS, :ROTOM, :UXIE, :MESPRIT,
    :AZELF, :GIRATINA_1, :CRESSELIA, :DARKRAI,
    # Gen 5
    :MUNNA, :MUSHARNA, :YAMASK, :COFAGRIGUS, :SOLOSIS, :DUOSION, :REUNICLUS,
    :VANILLITE, :VANILLISH, :VANILLUXE, :ELGYEM, :BEHEEYEM, :LAMPENT,
    :CHANDELURE, :CRYOGONAL, :HYDREIGON, :VOLCARONA, :RESHIRAM, :ZEKROM,
    # Gen 6
    :SPRITZEE, :DRAGALGE, :CARBINK, :KLEFKI, :PHANTUMP, :DIANCIE, :HOOPA,
    # Gen 7
    :VIKAVOLT, :CUTIEFLY, :RIBOMBEE, :COMFEY, :DHELMISE, :TAPUKOKO, :TAPULELE,
    :TAPUBULU, :COSMOG, :COSMOEM, :LUNALA, :NIHILEGO, :KARTANA, :NECROZMA,
    :MAGEARNA, :POIPOLE, :NAGANADEL,
    # Gen 8
    :ORBEETLE, :FLAPPLE, :SINISTEA, :POLTEAGEIST, :FROSMOTH, :DREEPY, :DRAKLOAK,
    :DRAGAPULT, :ETERNATUS, :REGIELEKI, :REGIDRAGO, :CALYREX
  ]

  # Lista de Pokémon que no aparecerán detrás del jugador al surfear,
  # independientemente de si son de tipo volador, tienen levitación o están
  # mencionados en el array LEVITATING_FOLLOWERS.
  SURFING_FOLLOWERS_EXCEPTIONS = [
    # Gen I
    :CHARIZARD, :PIDGEY, :SPEAROW, :FARFETCHD, :DODUO, :DODRIO, :SCYTHER,
    :ZAPDOS_1,
    # Gen II
    :NATU, :XATU, :MURKROW, :DELIBIRD,
    # Gen III
    :TAILLOW, :VIBRAVA, :TROPIUS,
    # Gen IV
    :STARLY, :HONCHKROW, :CHINGLING, :CHATOT, :ROTOM_1, :ROTOM_2, :ROTOM_3,
    :ROTOM_5, :SHAYMIN_1, :ARCEUS_2,
    # Gen V
    :ARCHEN, :DUCKLETT, :EMOLGA, :EELEKTRIK, :EELEKTROSS, :RUFFLET, :VULLABY,
    :LANDORUS_1,
    # Gen VI
    :FLETCHLING, :HAWLUCHA,
    # Gen VII
    :ROWLET, :DARTRIX, :PIKIPEK, :ORICORIO, :SILVALLY_2,
    # Gen VIII
    :ROOKIDEE, :CALYREX_1, :CALYREX_2
  ]
end

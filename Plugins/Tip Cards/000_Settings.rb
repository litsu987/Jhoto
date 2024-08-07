module Settings
    #====================================================================================
    #=============================== Tip Cards Settings =================================
    #====================================================================================
    
        #--------------------------------------------------------------------------------
        #  Set the default background for tip cards.
        #  The files are located in Graphics/Pictures/Tip Cards
        #--------------------------------------------------------------------------------	
        TIP_CARDS_DEFAULT_BG            = "bg"

        #--------------------------------------------------------------------------------
        #  If set to true, if only one group is shown when calling pbRevisitTipCardsGrouped,
        #  the group header will still appear. Otherwise, the header won't appear.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_SINGLE_GROUP_SHOW_HEADER = false

        #--------------------------------------------------------------------------------
        #  If set to true, when the player uses the SPECIAL control, a list of all
        #  groups available to view will appear for the player to jump to one.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_GROUP_LIST = true

        #--------------------------------------------------------------------------------
        #  Set the default text colors
        #--------------------------------------------------------------------------------	
        TIP_CARDS_TEXT_MAIN_COLOR       = Color.new(80, 80, 88)
        TIP_CARDS_TEXT_SHADOW_COLOR     = Color.new(160, 160, 168)

        #--------------------------------------------------------------------------------
        #  Set the sound effect to play when showing, dismissing, and switching tip cards.
        #  For TIP_CARDS_SWITCH_SE, set to nil to use the default cursor sound effect.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_SHOW_SE               = "GUI menu open"
        TIP_CARDS_DISMISS_SE            = "GUI menu close"
        TIP_CARDS_SWITCH_SE             = nil

        #--------------------------------------------------------------------------------
        #  Define your tips in this hash. The :EXAMPLE describes what some of the 
        #  parameters do.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_CONFIGURATION = {
            :EXAMPLE => { # ID of the tip
                    # Required Settings
                    :Title => _INTL("Example Tip"),
                    :Text => _INTL("This is the text of the tip. You can include formatting."),
                    # Optional Settings
                    :Image => "example", # An image located in Graphics/Pictures/Tip Cards/Images
                    :ImagePosition => :Top, # Set to :Top, :Bottom, :Left, or :Right.
                        # If not defined, it will place wider images to :Top, and taller images to :Left.
                    :Background => "bg2", # A replacement background image located in Graphics/Pictures/Tip Cards
                    :YAdjustment => 0, # Adjust the vertical spacing of the tip's text (in pixels)
                    :HideRevisit => true # Set to true if you don't want the player to see the tip again when revisiting seen tips.
            },
            :CATCH => {
                :Title => _INTL("Catching Pokémon"),
                :Text => _INTL("This is the text of the tip. You catch Pokémon by throwing a <c2=0999367C><b>Poké Ball</b></c2> at them."),
                :Image => "catch",
                :Background => "bg2"
            },
            :CATCH2 => {
                :Title => _INTL("Catching Pokémon"),
                :Text => _INTL("This is the text of the tip with a bottom picture. You catch Pokémon by throwing a <c2=0999367C><b>Poké Ball</b></c2> at them."),
                :Image => "catch",
                :ImagePosition => :Bottom,
                :Background => "bg2"
				
				            },
            :CATCH3 => {
                :Title => _INTL("Base Secreta"),
                :Text => _INTL("Noah a preparado una <c2=0999367C><b>base secreta</b></c2>, en ella"),
                :Image => "catch",
                :ImagePosition => :Bottom,
                :Background => "bg2"
				
            },
            :ITEMS => {
                :Title => _INTL("Items"),
                :Text => _INTL("This is the text of the other tip. You may find items lying around."),
                :Image => "items",
                :YAdjustment => 64
            },
            :ITEMS2 => {
                :Title => _INTL("Items"),
                :Text => _INTL("This is the text of the other tip with a right picture. You may find items lying around."),
                :Image => "items",
                :ImagePosition => :Right,
                :YAdjustment => 64
            },
            :BOOK1PAGE1 => {
                :Title => _INTL("Pagina 1"),
                :Text => _INTL("El circuito de aspirantes consiste en 3 fases.
1° Enfrentar 4 Gimnasios en <c2=0999367C><b>Johto</b></c2> y 4 Gimnasios de <c2=0999367C><b>Kanto</b></c2>."),
				:Image => "img1",
				:ImagePosition => :Bottom,
                :Background => "bg_book"
            },
            :BOOK1PAGE2 => {
                :Title => _INTL("Pagina 2"),
                :Text => _INTL("2° Los aspirantes serán divididos en 8 grupos en los que deberán enfrentarse, solo los ganadores de dicho torneo podrán continuar. "),
				:Image => "img2",
				:ImagePosition => :Bottom,
                :Background => "bg_book"
            },
            :BOOK1PAGE3 => {
                :Title => _INTL("Pagina 3"),
                :Text => _INTL("3° Al finalizar el torneo se deberá enfrentar los 4 Gimnasios de <c2=0999367C><b>Kanto</b></c2> y los últimos 4 Gimnasios restantes de <c2=0999367C><b>Johto</b></c2>."),
				:Image => "img3",
				:ImagePosition => :Bottom,
                :Background => "bg_book"
            },
            :BOOK1PAGE4 => {
                :Title => _INTL("Page 4"),
                :Text => _INTL("Durante la aventura podras crear distintos objetos."),
				:Image => "img4",
                :Background => "bg_book"
            },
			:BOOK1PAGE5 => {
                :Title => _INTL("Pagina 3"),
                :Text => _INTL("3° Al finalizar el torneo se deberá enfrentar los 4 Gimnasios de <c2=0999367C><b>Kanto</b></c2> y los últimos 4 Gimnasios restantes de <c2=0999367C><b>Johto</b></c2>."),
				:Image => "img5",
				:ImagePosition => :Bottom,
                :Background => "bg_book"
            }
        }

        TIP_CARDS_GROUPS = {
            :BEGINNER => {
                :Title => _INTL("Beginner Tips"),
                :Tips => [:CATCH, :CATCH2, :ITEMS, :ITEMS2]
            },
            :CATCHING => {
                :Title => _INTL("Catching Tips"),
                :Tips => [:CATCH, :CATCH2]
            },
            :ITEMS => {
                :Title => _INTL("Item Tips"),
                :Tips => [:ITEMS, :ITEMS2]
            },
            :BOOK1 => {
                :Title => _INTL("Book Alpha"),
                :Tips => [:BOOK1PAGE1, :BOOK1PAGE2, :BOOK1PAGE3, :BOOK1PAGE4]
            }
        }

end
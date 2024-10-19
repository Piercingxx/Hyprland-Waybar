

## PiercingXX'S KEYBINDINGS 
-----------------------------------------------------------------

#### General  
-----------------------------------------------------------------

bind = $mainMod, Q, killactive
bind = $mainMod SHIFT, Q, exit
bind = $mainMod, W, exec, $terminal
bind = $mainMod, SPACE, exec, $menu
bind = $mainMod, L, exec, wlogout
bind = ALT, TAB, exec, rofi -show window
bind = $mainMod, RETURN, exec, $fileManager
bind = $mainMod, PRINT, exec, grim -o HDMI-A-2 ~/Pictures/Screenshots/$(date +'%s.png') && nautilus ~/Pictures/Screenshots
bind = $mainMod, F, togglefloating
bind = $mainMod SHIFT, F, fullscreen, 
bind = $mainMod, R, exec, pkill waybar && waybar &
bind = $mainMod, S, exec, yad --html < ~/.config/hypr/keybindings.md --button=OK:0

#### Screenshot a region
bind = , PRINT, exec, hyprshot -m region
#### Screenshot a window
bind = $shiftMod, PRINT, exec, hyprshot -m window
#### Screenshot a monitor
bind = $mainMod, PRINT, exec, hyprshot -m output

#### Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

#### Move focus with mainMod + vim keys
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

#### Move window with mainMod + arrow keys
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

#### Move window with mainMod + vim keys
bind = $mainMod SHIFT, H, movewindow, l
bind = $mainMod SHIFT, L, movewindow, r
bind = $mainMod SHIFT, K, movewindow, u
bind = $mainMod SHIFT, J, movewindow, d

#### Resize Window with mainMod + vim keys
bindm = $mainMod, mouse:273, resizewindow
bind = $mainMod ALT, left, resizeactive, -100 0
bind = $mainMod ALT, right, resizeactive, 100 0
bind = $mainMod ALT, up, resizeactive, 0, -100
bind = $mainMod ALT, down, resizeactive, 0, 100

#### Resize Window with mainMod + vim keys
bindm = $mainMod, mouse:273, resizewindow
bind = $mainMod ALT, H, resizeactive, -100 0
bind = $mainMod ALT, L, resizeactive, 100 0
bind = $mainMod ALT, K, resizeactive, 0, -100
bind = $mainMod ALT, J, resizeactive, 0, 100

#### Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

#### Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

#### Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

#### Media control
bindl  = , XF86AudioPlay, exec, playerctl play-pause # toggle between media play and pause
bindl  = , XF86AudioPause, exec, playerctl play-pause # toggle between media play and pause
bindl  = , XF86AudioNext, exec, playerctl next # media next
bindl  = , XF86AudioPrev, exec, playerctl previous # media previous

#### Brightness control
bindel = , XF86MonBrightnessUp, exec, $scrPath/brightnesscontrol.sh i # increase brightness
bindel = , XF86MonBrightnessDown, exec, $scrPath/brightnesscontrol.sh d # decrease brightness
# Options
set __fish_git_prompt_show_informative_status "true"
set __fish_git_prompt_showcolorhints "true"
set __fish_git_prompt_showupstream "informative"
set __fish_git_prompt_showdirtystate "true"
set __fish_git_prompt_showuntrackedfiles "true"

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

function fish_right_prompt
  set last_status $status

  printf '%s ' (__fish_git_prompt)
  set_color normal
end

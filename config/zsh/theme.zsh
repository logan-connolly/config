# This theme is gruvbox material version of purepower(powerlevel10k)
# Based on: https://gist.github.com/sainnhe/f92372e14c59750b6ac8dc927ba9f7fe

() {
  emulate -L zsh && setopt no_unset pipe_fail
  zmodload zsh/terminfo

  function _pp_c() { print -nr -- $2 }
  function _pp_s() { print -nr -- $2 }

  typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      dir vcs virtualenv)

  typeset -ga POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      status command_execution_time background_jobs)

  local ins=$(_pp_s '>' '>')
  local cmd=$(_pp_s '<' '<')
  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    local p="\${\${\${KEYMAP:-0}:#vicmd}:+${${ins//\\/\\\\}//\}/\\\}}}"
    p+="\${\${\$((!\${#\${KEYMAP:-0}:#vicmd})):#0}:+${${cmd//\\/\\\\}//\}/\\\}}}"
  else
    p=$ins
  fi
  local ok="%F{#d4be98}${p}%f"
  local err="%F{#ea6962}${p}%f"

  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    typeset -g POWERLEVEL9K_SHOW_RULER=true
    typeset -g POWERLEVEL9K_RULER_CHAR=$(_pp_s '-' '─')
    typeset -g POWERLEVEL9K_RULER_BACKGROUND=none
    typeset -g POWERLEVEL9K_RULER_FOREGROUND='#665c54'
  else
    typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    function custom_rprompt() { }
  fi

  typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.$ok.$err) "

  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_{LEFT,RIGHT}_SEGMENTS=

  typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT,NOT_WRITABLE}_BACKGROUND=none
  typeset -g POWERLEVEL9K_{ETC,FOLDER,HOME,HOME_SUB}_ICON=
  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_COLOR='#e78a4e'
  typeset -g POWERLEVEL9K_LOCK_ICON=''
  typeset -g POWERLEVEL9K_DIR_{ETC,DEFAULT}_FOREGROUND='#89b482'
  typeset -g POWERLEVEL9K_DIR_{HOME,HOME_SUBFOLDER}_FOREGROUND='#a9b665'
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='#ea6962'

  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED}_MAX_NUM=99
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#7daea3'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#d8a657'
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#d3869b'
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND='#928374'
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNTRACKEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNSTAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_INCOMING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_OUTGOING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STASHFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_ACTIONFORMAT_FOREGROUND=001
  typeset -g POWERLEVEL9K_VCS_LOADING_ACTIONFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_LOADING_FOREGROUND

  typeset -g POWERLEVEL9K_VCS_GIT_ICON=''
  typeset -g POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
  typeset -g POWERLEVEL9K_VCS_GIT_GITLAB_ICON=''
  typeset -g POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=''
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
  typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=' '
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON=' '
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON=' '
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=' '
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='✩'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON=' '

  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=true
  typeset -g POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND='#d79921'

  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=none
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#ea6962'
  typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON=

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=none
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='#a89984'
  typeset -g POWERLEVEL9K_EXECUTION_TIME_ICON=

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=2
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_ICON=$(_pp_s '%%' '⇶')

  unfunction _pp_c _pp_s
} "$@"

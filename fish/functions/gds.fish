function gds --wraps='git diff --stat' --description 'alias gds=git diff --stat'
  git diff --stat $argv; 
end

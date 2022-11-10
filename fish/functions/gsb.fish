function gsb --wraps='git status -sb' --description 'alias gsb=git status -sb'
  git status -sb $argv; 
end

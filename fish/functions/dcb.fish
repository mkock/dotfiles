function dcb --wraps='docker-compose build' --description 'alias dcb docker-compose build'
  docker-compose build $argv
        
end

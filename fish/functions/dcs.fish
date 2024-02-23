function dcs --wraps='docker-compose stop' --description 'alias dcs docker-compose stop'
  docker-compose stop $argv
        
end

function dcu --wraps='docker-compose up --remove-orphans --detach' --description 'alias dcu docker-compose up --remove-orphans --detach'
  docker-compose up --remove-orphans --detach $argv
        
end

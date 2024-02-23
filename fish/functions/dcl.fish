function dcl --wraps='docker-compose logs --follow --timestamps' --description 'alias dcl docker-compose logs --follow --timestamps'
  docker-compose logs --follow --timestamps $argv
        
end

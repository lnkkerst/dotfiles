function ll --wraps='ls -lh' --wraps=exa_git --description 'alias ll exa_git'
  exa_git $argv; 
end

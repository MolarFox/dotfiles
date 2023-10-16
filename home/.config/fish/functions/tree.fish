# Defined in - @ line 1
function tree --wraps='tree -C' --description 'alias tree=tree -C'
 command tree -C $argv;
end

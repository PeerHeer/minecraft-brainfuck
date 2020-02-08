# Do setup.
function bfi:setup/objectives

execute unless score #bfi.busy bfi.var matches 1 run function #bfi:setup
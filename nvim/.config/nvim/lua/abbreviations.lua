local iabbs = {
    ipdb='import ipdb; ipdb.set_trace()',
    abhi='Abhijith Sethuraj',
    minauth='Author: sethuraj',
    Author='Author: Abhijith Sethuraj',
    logrus='log "github.com/sirupsen/logrus"'
}

for key, value in pairs(iabbs) do
    local vim_cmd = "iab " .. key .. " " .. value
    vim.cmd(vim_cmd)
end

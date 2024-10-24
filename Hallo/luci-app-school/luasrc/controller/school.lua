module("luci.controller.school", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/school") then
		return
	end

    local pack
    pack = entry({"admin", "services", "school"}, alias("admin", "services", "school", "set"), _("IPID设置"), 30)
    pack.i18n = "school"
    pack.dependent = true

    entry({"admin", "services", "school", "set"}, cbi("school/school"), _("基础设置"), 1).leaf = true
end

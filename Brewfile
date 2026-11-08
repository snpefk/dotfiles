# Shared tools only:
#   brew bundle --file=./Brewfile --no-upgrade
# Shared tools plus the selected laptop's additions:
#   brew bundle --file=./brewfiles/Brewfile.personal --no-upgrade
#   brew bundle --file=./brewfiles/Brewfile.work --no-upgrade
# Preview package names without installing:
#   brew bundle list --file=./brewfiles/Brewfile.personal
# Selection is explicit: no package install is triggered by chezmoi apply.
# --no-upgrade does not pin versions; avoid bundle cleanup unless intentional.

shared = File.join(__dir__, "brewfiles", "Brewfile.shared")
eval(File.read(shared), binding, shared)

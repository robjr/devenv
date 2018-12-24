#!/usr/bin/env bash
function cloneRepository() {
	read -r -p "Do you want to clone $1? [y/N] " response
	if [[ "$response" =~ ^(yes|y)$ ]]
	then
		git clone $1
	fi	
}
export -f cloneRepository

function cloneRepositoryOfUser() {
	echo 'Github:'
	curl "api.github.com/users/$1/repos" -L | jq '.[] | .ssh_url' | xargs -n1 -P1 -o bash -c 'cloneRepository "$@"' _

	echo 'Gitlab:'
	curl "https://gitlab.com/api/v4/projects?owned=true&private_token=$2" | jq '.[] | .ssh_url_to_repo' | xargs -n1 -P1 -o bash -c 'cloneRepository "$@"' _
}

function updateGitConfig() {
	echo 'Downloading latest file:'
	curl "https://github.com/robjr/devenv/raw/master/gitconfig" -L > ~/.gitconfig
}

####### Commands #######
alias clonerepos='cloneRepositoryOfUser'
alias updategitconfig='updateGitConfig'

####### Docker Compose #######
alias dc='docker-compose'
alias dcup='docker-compose up'
alias dcupb='docker-compose up --build'
alias dcupr='docker-compose up --force-recreate'
alias dcupbr='docker-compose up --build --force-recreate'
alias dcbash='docker-compose exec $1 bash'
alias dcupexec='dcUpAndExec'

function dcUpAndExec() {
  dcupr -d $1 && dc exec $1 bash
}
####### Docker #######
#alias dbash = function dbash() { docker exec -it $1 bash }

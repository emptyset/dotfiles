export PYPI_USERNAME=$(cat ~/.config/pip/pip.conf | grep extra-index-url | awk -F '[//|@]' '{print $3}' | awk -F '[:]' '{print $1}')
export PYPI_PASSWORD=$(cat ~/.config/pip/pip.conf | grep extra-index-url | awk -F '[//|@]' '{print $3}' | awk -F '[:]' '{print $2}')

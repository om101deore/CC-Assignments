if [[ $(id | grep root) ]]; then
    echo "This is root user"
else
    command
    echo "This is not root user"
fi

echo "================================"
echo "=======RUN DEV CONTAINER========"
echo "================================"
echo ""

touch .zsh_history
docker-compose up -d iac 

echo ""
echo "================================"
echo "======SWITCH TO CONTAINER======="
echo "================================"
echo ""
docker-compose exec -ti iac zsh



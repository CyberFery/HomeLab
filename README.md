# Cybersecurity Homelab

Welcome to my Cybersecurity Homelab repository! This project is a hands-on environment where I practice penetration testing, ethical hacking, and security research. It’s designed to simulate real-world scenarios, automate repetitive tasks, and document my learning journey. My goal is to demonstrate my skills, thought process, and progress to potential employers.

---

## **Why This Homelab?**
As someone passionate about cybersecurity, I wanted a practical way to:
- Learn by doing: Experiment with tools and techniques in a safe, controlled environment.
- Automate repetitive tasks: Use scripting and Docker to streamline setup and teardown.
- Document my progress: Showcase my skills and thought process to potential employers.

This homelab is a reflection of my commitment to continuous learning and my ability to solve real-world problems.

---

## **Tools and Technologies**
- **Docker**: Containerization for isolated, reproducible environments.
- **Docker Compose**: Orchestration for multi-container setups.
- **Bash Scripting**: Automation of setup and teardown processes.
- **Cybersecurity Tools**:
  - **Metasploit**: Exploitation and post-exploitation.
  - **Nmap**: Network scanning and enumeration.
  - **Parrot Security OS**: A security-focused Linux distribution.

---

## **Homelab Setup**

### **Core Components**
The homelab consists of the following Docker images:
1. **`hackeracademy/metasploitable`**: A vulnerable target machine for practicing exploits.
2. **`parrotsec/security`**: A security-focused Linux distribution with penetration testing tools.
3. **`parrotsec/nmap`**: A lightweight image for network scanning and enumeration.
4. **`parrotsec/metasploit`**: A Metasploit framework image for exploitation and post-exploitation.

### **Automation**
To make the setup process seamless, I created:
- A **`docker-compose.yml`** file to define and manage the containers.
- A **`setup.sh`** script to automate the pulling of images and starting of containers.

You can find these files in the root of this repository.

---

## **Labs and Exercises**

### **Lab 1: Exploiting vsftpd 2.3.4 Backdoor**
- **Objective**: Exploit the vsftpd 2.3.4 backdoor vulnerability on the Metasploitable target.
- **Steps**:
  1. Scanned the Metasploitable target using Nmap to identify open ports:
     ```bash
     nmap -sV <metasploitable_ip>
     ```
     - Discovered that port 21 (FTP) was running vsftpd 2.3.4.
  2. Researched the vsftpd 2.3.4 vulnerability and found that it has a known backdoor.
  3. Used Metasploit to exploit the vulnerability:
     ```bash
     msfconsole
     use exploit/unix/ftp/vsftpd_234_backdoor
     set RHOSTS <metasploitable_ip>
     exploit
     ```
  4. Gained a reverse shell on the target system.
  5. Explored the target system and extracted the `/etc/passwd` file.
- **Hurdles**:
  - **Issue**: The exploit failed initially because the payload was not configured correctly.
  - **Solution**: Switched to a generic reverse shell payload (`cmd/unix/reverse`) and re-ran the exploit.
- **Outcome**: Successfully exploited the vsftpd 2.3.4 backdoor and gained access to the target system.

### **Lab 2: Exploiting Samba usermap_script**
- **Objective**: Exploit the Samba `usermap_script` vulnerability on the Metasploitable target.
- **Steps**:
  1. Scanned the Metasploitable target using Nmap:
     ```bash
     nmap -sV <metasploitable_ip>
     ```
     - Discovered that port 445 (SMB) was running Samba 3.0.20-Debian.
  2. Researched the Samba `usermap_script` vulnerability and found that it allows remote command execution.
  3. Used Metasploit to exploit the vulnerability:
     ```bash
     msfconsole
     use exploit/multi/samba/usermap_script
     set RHOSTS <metasploitable_ip>
     exploit
     ```
  4. Gained a reverse shell on the target system.
  5. Escalated privileges to root using a local exploit (`exploit/linux/local/samba_symlink_traversal`).
- **Hurdles**:
  - **Issue**: The initial exploit gave a low-privilege shell.
  - **Solution**: Used privilege escalation techniques to gain root access.
- **Outcome**: Successfully exploited the Samba vulnerability and gained root access to the target system.

### **Lab 3: Exploiting UnrealIRCd Backdoor**
- **Objective**: Exploit the UnrealIRCd backdoor vulnerability on the Metasploitable target.
- **Steps**:
  1. Scanned the Metasploitable target using Nmap:
     ```bash
     nmap -sV <metasploitable_ip>
     ```
     - Discovered that port 6667 (IRC) was running UnrealIRCd.
  2. Researched the UnrealIRCd backdoor vulnerability and found that it allows remote command execution.
  3. Used Metasploit to exploit the vulnerability:
     ```bash
     msfconsole
     use exploit/unix/irc/unreal_ircd_3281_backdoor
     set RHOSTS <metasploitable_ip>
     exploit
     ```
  4. Gained a reverse shell on the target system.
  5. Explored the target system and extracted the `/etc/shadow` file.
- **Hurdles**:
  - **Issue**: The exploit failed initially because the target service was not responding.
  - **Solution**: Restarted the UnrealIRCd service on the Metasploitable target and re-ran the exploit.
- **Outcome**: Successfully exploited the UnrealIRCd backdoor and gained access to the target system.

---

## **What’s Next?**
- Add more labs, including web application testing, privilege escalation, and network traffic analysis.
- Expand the homelab by including additional tools and vulnerable targets to simulate more complex environments.

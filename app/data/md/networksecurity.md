---
- hosts: networksecurity
  user: n1[0-9]
  tasks:
    - name: install Security/Network/Internet knowledge
      copy: name={{ item }} state=latest
      with_item:
        - CIW
        - SEA/J
        - Network+
        - IT Passport
    - name: Server Building/Networking Skills
      copy: name={{ item }} state=latest
      with_item:
        - Server Building
        - Amazon Web Services
        - Network Setting
    - name: Presentation
      copy: name={{ item }} state=latest
      with_item:
        - Presentation
        - Graduation Work
    - name: JobHunting/Human Skills
      copy: name="{{ item }}" state=latest
      with_item:
        - Business Manner
        - JobHunting
        - Peer Support

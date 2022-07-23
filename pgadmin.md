# pgadmin for all linux system
* install
```
sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin 
sudo chown $USER /var/lib/pgadmin
sudo chown $USER /var/log/pgadmin
mkdir pgadmin
cd pgadmin
python3 -m venv venv
venv/bin/pip install pgadmin4 gevent
echo "source venv/bin/activate" > pgadmin
echo "pgadmin4" >> pgadmin
chmod +x pgadmin 
```
* run: with `./pgadmin`

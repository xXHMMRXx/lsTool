import os
from posixpath import split;

css = ['gnome-shell.css', 'gdm3.css']
tempPath = '/tmp/gs-custom';
gsPath = '/usr/share/gnome-shell/theme/Yaru';
backup = '/usr/share/original-gnome-shell';
gresource = '/usr/share/gnome-shell/gnome-shell-theme.gresource';
baseGR = '/org/gnome/shell/theme/';
fileXML = 'gnome-shell-theme.gresource.xml';
targetFile = 'gnome-shell-theme.gresource';
gresourceList = [];

def compileAll():
  os.system(f'cd {tempPath} && glib-compile-resources {fileXML} && cp {targetFile} {gsPath}');
  
  if(os.path.exists(tempPath+'/'+targetFile)):
    os.system('cd /tmp/ && rm -rf gs-custom/');
    print(' Done.\n');
    print(' # you can now restart your computer or simply switch to another user to see the changes made :D');
  else:
    print(' Sorry :(\n Something went wrong, please try again or contact the developer.');

def customCSS(fileName):
  for sFName in css:
    trigger = 0;
    count = 0;
    count2 = -1;
    file = open(os.path.join(tempPath+'/'+sFName), 'r');
    content = file.read();
    temp = content.find('#lockDialogGroup');
    
    while trigger == 0:
      char = content[(temp + count2):(temp + count)];
      count = count + 1;
      count2 = count2 + 1;
      if(char == '}'):
        file.close();
        trigger = 1;

    textToReplace = content[temp:(temp + count - 1)];
    newText = "#lockDialogGroup { background: url(resource:///org/gnome/shell/theme/"+ fileName + "); background-size: cover; background-repeat: no-repeat; background-position: center; }"

    newFile = open(os.path.join(tempPath+'/'+css), 'w');
    newContent = content.replace(textToReplace, newText);
    newFile.write(newContent);
    newFile.close();

def createConfigFiles(img):
  if (os.path.exists(tempPath)):
    os.system(f'rm -rf {tempPath}');
    createConfigFiles(img);
  else:

    image = img;
    array = image.split('/');
    fileName = array[len(array) - 1];

    os.system('mkdir -p /tmp/gs-custom/icons/scalable/status');
    os.system('mkdir /tmp/gs-custom/icons/scalable/actions');
    os.system(f'gresource list {gsPath}/gnome-shell-theme.gresource > {tempPath}/list.config');
    os.system(f'cp {image} {tempPath}/');

    readFile = open(f'{tempPath}/list.config', 'r');

    for line in readFile:
      ext = line.split(baseGR)[1].replace('\n', '').split('.');      
      if(ext[1] != 'jpg' and ext[1] != 'jpeg' and ext[1] != 'png'):
        gresourceList.append(line.split(baseGR)[1].replace('\n', ''));

    for resource in gresourceList:
      os.system(f'gresource extract {gresource} {baseGR}{resource} > {tempPath}/{resource}');

    os.system(f"echo '<?xml version=1.0 encoding=UTF-8?>' > {tempPath}/{fileXML}");
    os.system(f"echo '<gresources>' >> {tempPath}/{fileXML}");
    os.system(f"echo '  <gresource prefix=\"/org/gnome/shell/theme\">' >> {tempPath}/{fileXML}");

    for resource in gresourceList:
      os.system(f"echo '    <file>{resource}</file>' >> {tempPath}/{fileXML}");
      if(resource == 'gnome-shell.css'):
        os.system(f"echo '    <file>{fileName}</file>' >> {tempPath}/{fileXML}");

    os.system(f"echo '  </gresource>' >> {tempPath}/{fileXML}");
    os.system(f"echo '</gresources>' >> {tempPath}/{fileXML}");

    customCSS(fileName);

def backupGnomeShell():
  if (os.path.exists(backup)):
    print('\n # >>> Backup is already exist <<<\n');
    return True
  else:
    os.system(f'cp -r {gsPath} {backup}');
    if (os.path.exists(backup)):
      print('\n # >>> Backup successfully created <<<\n');
      return True
    else:
      os.system("echo '\n\e[1;31m # >>> Error creating backup copy <<<\e[0m\n'");
      return False

def changeBackgroundImg(img):
  if (backupGnomeShell()):
    createConfigFiles(img);
    compileAll();
  else:
    exit

def resetGnomeShell():
  if(os.path.exists(backup)):
    print('\n # Backup found :)\n');
    os.system(f'cd /usr/share/ && rm -rf gnome-shell && mv original-gnome-shell gnome-shell');
    print(' # gnome-shell was successfully restored :D\n');
  else:
    print('\n # The backup does not exist :(\n');

def main(opt, img):
  if (opt == 1 and img != ''):
    changeBackgroundImg(img);
  elif (opt == 2):
    resetGnomeShell();

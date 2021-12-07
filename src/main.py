import argparse;
import kali;
import debian;

parser = argparse.ArgumentParser('python3 main.py');
parser.add_argument('--os', required=True, type=str, help='Operating system');
parser.add_argument('--option', required=True, type=int, help='Option');
parser.add_argument('--img', required=False, type=str, help='Image');
args = parser.parse_args();

def main():
  if (args.os == 'kali'):
    kali.main(args.option, args.img);
  elif (args.os == 'debian'):
    debian.main(args.option, args.img);


if __name__=='__main__':
  main();
#!/usr/bin/python

# Wrapper for youtube-dl

from subprocess import call
import argparse
import os

audio = '-x --audio-format m4a' 
video = '--merge-output-format mkv' 
audio_folder = 'D:\\Users\\youruser\\Desktop\\music\\new\\'
video_folder = 'D:\\Users\\youruser\\Desktop\\videos\\'
subs = '--write-sub --sub-lang %s'
filename = '%(title)s.%(ext)s'

parser = argparse.ArgumentParser(description='Wrapper for youtube-dl')

parser.add_argument('-x', '--extract-audio', action='store_true', help='extract audio')
parser.add_argument('-s', '--sub-lang', help='subs language to download')
parser.add_argument('-f', '--folder', help='folder path')
parser.add_argument('-m', '--manual', default='', help='params to pass directly to youtube-dl, written between quotes like one string')
parser.add_argument('videos', nargs='+', help='url to video')

if __name__ == '__main__':
	args = parser.parse_args()

	params = ['youtube-dl',]

	if args.sub_lang:
		subs = subs % args.sub_lang
	else:
		subs = ''

	if args.folder:
		if args.folder[-1] == os.path.sep:
			folder = args.folder + filename
		else:
			folder = args.folder + os.path.sep + filename

	if args.extract_audio:
		if not args.folder:
			folder = audio_folder + filename
		elif not os.path.isabs(args.folder):
			folder = audio_folder + args.folder + os.path.sep + filename

		params += audio.split()
	else:
		if not args.folder:
			folder = video_folder + filename
		elif not os.path.isabs(args.folder):
			folder = video_folder + args.folder + os.path.sep + filename

		params += video.split() + subs.split()

	call(params + ['-o', folder] + args.manual.split() + args.videos)

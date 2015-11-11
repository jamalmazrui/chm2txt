# chm2txt

Version 1.2  
November 11, 2015  
Copyright 2009 - 2015 by Jamal Mazrui  
GNU Lesser General Public License (LGPL)  

## Contents
- [Description](#description)
- [Operation](#operation)
- [Structured Text Format](#structured-text-format)
- [Development Notes](#development-notes)

## Description

chm2txt (chm2txt.exe) is a command line utility under Windows that converts a file from Compiled HTML format (.chm) to structured text format (.txt).  Combining multiple HTML and graphics files, the CHM format is commonly used for software documentation, e.g., the help that is displayed by pressing F1.  The default help viewing program, however, can be challenging for searching globally or reading continuously.  A single, structured text file provides an alternative, particularly when viewed with an editor that understands a few organizational conventions.  chm2txt is thus a free, open source program that seeks to fill an observed need of many users for more convenient ways of searching and reading software documentation.

The original version was written in the Perl language.  Its source code and executable are still included in the distribution archive (as Perl_chm2txt.pl and Perl_chm2txt.exe).  The new version is written in the WinBatch language, adopting code I had been using privately for years to convert help files to text.  It is more reliable and sophisticated, e.g., ordering topics according to the outline view of the CHM file, rather than in simple alphabetical sequence.  The same approach could have been taken with Perl;  I just happen to be more familiar with WinBatch and had an existing code base that I could hone for this purpose.

## Operation

The command line syntax of chm2txt is as follows:
`chm2txt "SourceFile.chm" "TargetFile.txt"`

A file name should be fully qualified, that is, include a leading path -- either absolute or relative -- if not located in the current directory.  Quotes around a file may be omitted if it does not include a space character.  The target may be omitted to produce one named like the source except for a .txt extension.  Status messages are spoken during the conversion process, via a screen reader if one is running (NVDA, JAWS, System Access, or Window-Eyes) or via the default speech engine of Windows.  The older, Perl version prints messages to the console, but a WinBatch program cannot do this.

Rather than a single source file, a wildcard specification may be given for a batch conversion, e.g., 
`chm2txt c:\temp\*.chm`

In this case, a target file is created for each matching source file.

The executable file, `chm2txt.exe`, may be copied to and run from any directory.  When first run, the program extracts some .dll and other support files to the same directory.  It also creates a temporary workspace in a subdirectory of the user's `temp` directory.  

Other applications may invoke chm2txt for conversions, possibly behind a graphical user interface (GUI) for specifying source and target files.  For example, this capability is part of the EdSharp editor, available at
<http://EmpowermentZone.com/EdSharp_setup.exe>

In EdSharp, press Control+Shift+O to Open Other Format, specify the name of a .chm file, and find the converted text in a new document window.

## Structured Text Format

chm2txt creates files in "structured text format."  Such a file is divided into sections separated by a character sequence consisting of a hard page break and line break (ASCII 12, 13, and 10 codes).  The first section is the table of contents, and remaining sections are the body.  Each topic name in the contents is also a section heading in the body.

EdSharp includes keys for navigating such a file in a manner comparable to navigating a CHM in the help viewer program of Windows.  Press Control+PageDown to go to the next section, or Control+PageUp for the previous one.  Press F6 to go from a topic in the contents to its corresponding section in the body.  Press Shift+F6 to reverse that, going from a section in the body to its topic in the contents.  Press Control+F6 to search for a section based on text in its topic name.  Press Alt+F6 to search for the next match.

EdSharp can also convert a structured text file to an equivalent HTML version, with a table of contents linked to section headings.  Press Control+H to convert the current file to HTML format.  Press Control+S to save it to disk.  Press F5 to launch it in the default web browser.

## Development Notes

I developed the original chm2txt with the Perl Developer Kit 7.0 from
<http://ActiveState.com>
It incorporates Perl 5.8, as well as the libraries Text::CHM, HTML::Stripper, and File::OldSlurp from the Comprehensive Perl Archive Network at
<http://cpan.org>

The current chm2txt is developed with the commercial WinBatch compiler from
<http://WinBatch.com>

The distribution archive, chm2txt.zip, contains source code and build files for both Perl and WinBatch.  The code is available under the GNU Lesser General Public License (LGPL), described at
<http://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License>

Support files in this distribution include the free 7-Zip utility from <http://www.7-zip.org> and SayLine utility from `<ttps://github.com/JamalMazrui/SayIt>.

I welcome feedback, which helps chm2txt improve over time.  When reporting a problem, the more specifics the better, including steps to reproduce it, if possible.  If you happen to be a programmer, please consider contributing code that fixes a problem or improves functionality.


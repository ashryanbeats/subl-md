# subl-md.sh

This is a very opinionated script for a specific use case in writing and previewing Markdown documents.

## Workflow

**You**

1. Pass in a filename

**Script**

1. Make a new `.md` file
1. Open in Sublime Text
1. Open Markdown preview in Marked 2


## Requirements

- macOS / OS X (dependencies checking uses `system_profiler`)
- Sublime Text CLI
- Marked 2


## Usage

```
/path/to/subl-md.sh [-d] [filename]
```

Or, if you make an alias (e.g., `blog`):

```
blog [-d] [filename]
```

### Options

**-d** Check dependencies. The script will check for the Sublime Text CLI and the Marked 2 app.

**filename** The filename (without extension) that you want to use. If you don't pass a filename via the command line, the script will ask you for one.
package main

import (
	_ "embed"
	"fmt"
	"os"
	"path/filepath"

	Z "github.com/rwxrob/bonzai/z"
	"github.com/rwxrob/choose"
	"github.com/rwxrob/fs/dir"
	"github.com/rwxrob/fs/file"
)

//go:embed lynx.lss
var lss string // styles and colors that go with gruvbox terminal theme

//go:embed lynx.cfg
var cfg string // vim-based configurations for lynx

//go:embed lynx
var lynx string // handles environment variable setup but still finds lynx binary

var Cmd = &Z.Cmd{
	Call: func(_ *Z.Cmd, _ ...string) error {

		// create ~/.config/lynx if not exists
		confdir, err := os.UserConfigDir()
		if err != nil {
			return err
		}
		target := filepath.Join(confdir, `lynx`)
		if !dir.Exists(target) {
			err := dir.Create(target)
			if err != nil {
				return err
			}
		}

		// write the lss and cfg files to dir
		cfgpath := filepath.Join(target, `lynx.cfg`)
		if err := file.Overwrite(cfgpath, cfg); err != nil {
			return err
		}
		fmt.Printf("lynx.cfg written to %v\n", cfgpath)
		lsspath := filepath.Join(target, `lynx.lss`)
		if err := file.Overwrite(lsspath, lss); err != nil {
			return err
		}
		fmt.Printf("lynx.lss written to %v\n", lsspath)

		// copy the lynx script to the path location specified
		path := filepath.SplitList(os.Getenv(`PATH`))
		fmt.Println(`Which path should we put the binaries in? (You must have access.)`)
		_, target, err = choose.From(path)
		if err != nil {
			return err
		}

		lynxpath := filepath.Join(target, `lynx`)
		if err := file.Overwrite(lynxpath, lynx); err != nil {
			return err
		}
		fmt.Printf("lynx written to %v\n", lynxpath)
		err = os.Chmod(lynxpath, 0700)
		if err != nil {
			return err
		}
		return nil
	},
}

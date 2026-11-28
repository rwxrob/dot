# WSL2 settings

[`setup`](setup) copies [`wslconfig`](wslconfig) to `%USERPROFILE%\.wslconfig` on the Windows host. It does nothing unless the kernel release name includes `WSL2`. An existing file that differs is backed up next to it and then replaced, not merged, so add any settings you want to keep to [`wslconfig`](wslconfig) first.

The one setting so far turns on mirrored networking, which needs Windows 11 22H2 or later. WSL then shares the Windows network, so `localhost` works in both directions. In the default mode (NAT), `localhost` inside WSL does not reach servers running on Windows.

## Why `wsl --shutdown`

Running `setup` only copies the file. Nothing changes yet, because WSL reads `.wslconfig` when its virtual machine starts, and that machine can keep running after you close every terminal window. `wsl --shutdown` stops it, so the next start reads the new file. `setup` never runs this for you.

**It is not a Windows shutdown, and it does not delete your distributions or their files.** It does immediately stop **every** running WSL2 distribution and everything in them, including:

* open shells and `tmux` sessions
* editors, so unsaved work is lost
* servers, builds, downloads and other background jobs
* anything else that runs on WSL2, such as Docker Desktop's WSL2 backend

## Applying a change

1. Save your work and let long jobs finish.

1. In PowerShell on Windows, run:

   ```powershell
   wsl --shutdown
   ```

   Running `wsl.exe --shutdown` from inside WSL works too, but it ends the shell you run it from.

1. Open a WSL terminal again, which starts WSL back up.

1. Check the result:

   ```sh
   wslinfo --networking-mode
   ```

   It should print `mirrored`.

You only need to do this again after `.wslconfig` changes. When `setup` says the file `is up to date`, it changed nothing. If you have not restarted WSL since it last copied the file, you still need to.

## Going back

Edits made only to the Windows copy are replaced the next time `setup` runs, so decide what the repo copy should say too. To return to NAT mode, remove the `networkingMode` line from [`wslconfig`](wslconfig), run `setup`, and then `wsl --shutdown`.

Other devices on your network may still need a Windows firewall rule to reach a server in WSL, and some VPN, Docker or port setups behave differently in mirrored mode. See Microsoft's [WSL networking](https://learn.microsoft.com/windows/wsl/networking) and [`.wslconfig`](https://learn.microsoft.com/windows/wsl/wsl-config) documentation.

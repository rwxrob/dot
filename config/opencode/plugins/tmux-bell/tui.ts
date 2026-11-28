// Rings the terminal bell when the session shown in this window needs you, so
// that tmux can mark the window (see the "w" binding in config/tmux/tmux.conf).
import { Plugin } from "@opencode/plugin/tui"

export default Plugin.define({
  id: "dot.tmux-bell",
  setup(context) {
    const data = context.data.session

    // every window hears the events of every session on the shared server, so
    // only ring for the session shown here and its subagents (not for tabs,
    // which windows in the same directory share)
    const mine = (sessionID: string) => {
      const route = context.ui.router.current()
      return route.type === "session" && data.root(route.sessionID) === data.root(sessionID)
    }

    const ring = (sessionID: string) => {
      if (mine(sessionID)) process.stdout.write("\x07")
    }

    // a finished subagent, or a session still waiting on one, is not waiting
    // on you yet
    const finished = (sessionID: string) => {
      if (data.get(sessionID)?.parentID) return
      const busy = data
        .family(sessionID)
        .some((id) => id !== sessionID && data.status(id) === "running")
      if (!busy) ring(sessionID)
    }

    const stops = [
      context.data.on("permission.asked", (event) => ring(event.data.sessionID)),
      context.data.on("form.created", (event) => ring(event.data.form.sessionID)),
      context.data.on("session.execution.succeeded", (event) => finished(event.data.sessionID)),
      context.data.on("session.execution.failed", (event) => finished(event.data.sessionID)),
    ]
    return () => stops.forEach((stop) => stop())
  },
})

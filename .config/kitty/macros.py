import os
import subprocess


def main(args):
    macros_file = os.path.expanduser("~/.config/kitty/macros.txt")

    try:
        with open(macros_file) as f:
            macros = f.read()
        result = subprocess.run(
            ["fzf", "--with-nth=1", "--preview", "echo {2..}", "--preview-window=bottom:3:wrap"],
            input=macros, stdout=subprocess.PIPE, text=True,
        )
        selected_line = result.stdout.strip()
        if not selected_line:
            return ""
        parts = selected_line.split(maxsplit=1)

        if len(parts) == 2:
            return parts[1].strip()
        else:
            return selected_line

    except Exception:
        return ""

def handle_result(args, answer, target_window_id, boss):
    if not answer:
        return

    window = boss.window_id_map.get(target_window_id)
    if window:
        window.paste_text(answer)

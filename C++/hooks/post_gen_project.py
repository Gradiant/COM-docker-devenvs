from pathlib import Path

def change_line_endings_CRLF_to_LF():
    for path in Path(".").glob("**/*"):
        if path.is_file():
            data = path.read_bytes()
            lf_data = data.replace(b"\r\n", b"\n")
            path.write_bytes(lf_data)

if __name__ == "__main__":
    change_line_endings_CRLF_to_LF()
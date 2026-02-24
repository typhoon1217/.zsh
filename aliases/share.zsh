# File sharing with QR - scan & download on any phone

# Fast web uploads (no app needed)
gshare() { share "$1" gofile; }   # gofile.io - fast, no limits [default]
pshare() { share "$1" pixel; }    # pixeldrain - fast
xshare() { share "$1" 0x0; }      # 0x0.st
tshare() { share "$1" transfer; } # transfer.sh - slow

# Local network (fastest - same WiFi)
lshare() { share "$1" local; }    # qrcp direct transfer

# P2P (needs app on receiver)
cshare() { share "$1" croc; }     # croc

# Generate QR from text/url
qr() { echo "$1" | qrencode -t ANSI; }

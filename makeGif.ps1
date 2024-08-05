Get-ChildItem -Path .\ -Filter "*.mp4" | ForEach-Object {
    ffmpeg -i ".\$($_.BaseName).mp4" -vf "fps=10,scale=600:-1:flags=lanczos,palettegen" "$($_.BaseName).png"
    ffmpeg -i ".\$($_.BaseName).mp4" -i ".\$($_.BaseName).png" -filter_complex "fps=10,scale=600:-1:flags=lanczos[x];[x][1:v]paletteuse" ".\$($_.BaseName).gif"
    Remove-Item ".\$($_.BaseName).png"
}
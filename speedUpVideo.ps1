Get-ChildItem -Path .\ -Filter "*.mp4" | ForEach-Object {
    ffmpeg -i ".\$($_.BaseName).mp4" -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" "$($_.BaseName)_SpeedUp.mp4"
}
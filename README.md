# About 'Dis Mac :apple: :climbing:
---

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/58a75e0d2563469f8a4a9ec4ad24df5d)](https://www.codacy.com/app/marshki/about_dis_mac?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/about_dis_mac&amp;utm_campaign=Badge_Grade)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Zsh script to mimic the [About This Mac](https://support.apple.com/en-us/HT201581) feature in macOS (Apple Sillicon).

## Sample Output

---

          Model Name: MacBook Neo
                Chip: Apple A18 Pro
              Memory: 8 GB
       Serial Number: XXXXXXXXXX
        Startup Disk: Macintosh HD
               macOS: Tahoe 26.4.1

## Supported Versions of macOS

|macOS|Version    |
|---  |---        |
|14.* |Sonoma     |
|13.* |Ventura    |
|12.* |Monterey   |
|11.* |Big Sur    |
|10.15|Catalina   |
|10.14|Mojave     |
|10.13|High Sierra|
|10.12|Sierra     |
|10.11|El Capitan |
|10.10|Yosemite   |

## Getting Started

__Liftoff:__

Make this script accessible to all users by placing it in: `/usr/local/bin`;

set the executable bit on the file:

`chmod +x aboutMe`;

then call it:

`bash aboutMe`.

## History

| Version| Relase Date|
| ---    | ---        |
| v.0.3  |04-AUG-2022 |
| v.0.2  |05-APR-2021 |
| v.0.1  |07-JUL-2018 |
| v.0.0  |15-AUG-2017 |

## License

[LICENSE](https://github.com/marshki/about_dis_mac/blob/master/LICENSE)

## Acknowledgements

`hardware_model_too.sh` adpated from [this thread](https://www.reddit.com/r/macsysadmin/comments/bmycmz/submission_about_this_mac_command_line_edition/).
 
Shout-out to: [https://reddit.com/u/Thanksagainforlunch](https://reddit.com/u/Thanksagainforlunch) for the suggestion.

## Issues

[A list of issues for this repository.](https://github.com/marshki/about_dis_mac/issues)

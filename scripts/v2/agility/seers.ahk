#Requires AutoHotkey v2.0

seers_course := [
  {
    x: 2727,
    y: 3483,
    z: 0,
    next_color: colors.pink,
    randomizer: 0,
    label: "step_1",
  },
  {
    x: 2729,
    y: 3491,
    z: 3,
    next_color: colors.pink,
    randomizer: 3,
    label: "step_2",
  },
  {
    x: 2713,
    y: 3494,
    z: 2,
    next_color: colors.pink,
    randomizer: 3,
    label: "step_3",
  },
  {
    x: 2710,
    y: 3480,
    z: 2,
    next_color: colors.off_cyan,
    randomizer: 3,
    label: "step_4",
  },
  {
    x: 2710,
    y: 3472,
    z: 3,
    next_color: colors.pink,
    randomizer: 3,
    label: "step_5",
  },
  {
    x: 2702,
    y: 3465,
    z: 2,
    next_color: colors.pink,
    randomizer: 3,
    label: "step_6",
  },
  {
    x: 2710,
    y: 3484,
    z: 0,
    next_color: colors.off_cyan,
    randomizer: 3,
    label: "fall_1",
  },
  {
    x: 2712,
    y: 3472,
    z: 3,
    next_color: colors.pink,
    randomizer: 3,
    label: "step_5",
  },
  {
    x: 2724,
    y: 3484,
    z: 0,
    next_color: colors.pink,
    randomizer: 3,
    label: "unkown2",
  },
  {
    x: 2704,
    y: 3464,
    z: 0,
    next_color: colors.pink,
    randomizer: 3,
    label: "step_6",
    use_minimap: True,
    minimap: [
      {
        x: 709,
        y: 80,
        sleep_for: 9500
      },
      {
        x: 674,
        y: 74,
        sleep_for: 5000
      },
    ]
  },
]
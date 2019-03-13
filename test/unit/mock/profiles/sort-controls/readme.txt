
# Legend:
# - 'profile name'
# - \file name\
# - [control within file]


'profile_layer_top'                # top level profile, includes 2 profiles
   - 'profile_layer_a'             # profile first layer, contains 5 control files holding 3 tests + 2 inheritances 
   |      |
   |      - \test-1a               # Control file test-1A .. test-3A must be sorted 
   |      |    [test-1a]           # test-1a controls file contains test 'test-1a'
   |      - \test-3a   
   |      |    [test-3a            # test-3a controls file contains test 'test-3a'
   |      - \test-2a               # test-2a controls file contains test & include
   |      |    [test-2a]                    
   |      |    'profile_layer_c'   # profile included by test-2a controls file 
   |      |       |
   |      |       - \test-1c       # Controls test-1C...test-3C must be sorted
   |      |       |    [test-1c]
   |      |       - \test-2c
   |      |       |    [test-2c]
   |      |       - \test-3c
   |      |       |    [test-3c]
   |      - 'profile_layer_d'        
   |             |
   |             - \test-1d
   |             |    [test-1d]
   |             - \test-2d
   |             |    [test-2d]
   |             - \test-3d
   |                  [test-3d]
   |
   - 'profile_layer_b'
          - \test-1b
          |    [test-1b]
          - \test-2b
          |    [test-2b]
          - \test-3b
               [test-3b]


# Expected output of the overview 
# (the order of the lines can vary, the order within a profile is sorted):
# - (test-1a, test-2a, test-3a),
# - (test-1d, test-2d, test-3d),
# - (test-1c, test-2c, test-3c),
# - (test-1b, test-2b, test-3b)

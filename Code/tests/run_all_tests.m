function results = run_all_tests()
%RUN_ALL_TESTS Run all tests under Code/tests.

import matlab.unittest.TestSuite

testRoot = fileparts(mfilename("fullpath"));
suite = TestSuite.fromFolder(testRoot, "IncludingSubfolders", true);
results = run(suite);
end

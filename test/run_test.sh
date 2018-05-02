#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testValidBuildpackWithTests()
{
  mkdir -p ${OUTPUT_DIR}/valid_buildpack/test
  touch ${OUTPUT_DIR}/valid_buildpack/test/sample_test.sh

  capture ${BUILDPACK_TEST_RUNNER_HOME}/bin/run ${OUTPUT_DIR}/valid_buildpack
  assertContains "BUILDPACK: ${OUTPUT_DIR}/valid_buildpack" "$(cat ${STD_OUT})"
  assertContains "Ran 0 tests." "$(cat ${STD_OUT})"
  assertContains "ALL OK" "$(cat ${STD_OUT})"
  assertNotContains "FAILURES (see individual results for details)" "$(cat ${STD_OUT})"
  assertEquals "" "$(cat ${STD_ERR})"
  assertEquals "0" "${rtrn}"
}
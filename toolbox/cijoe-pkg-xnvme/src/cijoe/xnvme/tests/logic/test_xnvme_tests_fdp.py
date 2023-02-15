import pytest

from ..conftest import xnvme_parametrize


@xnvme_parametrize(labels=["fdp"], opts=["be", "admin"])
def test_fdp_io(cijoe, device, be_opts, cli_args):

    if be_opts["sync"] in ["block", "psync"]:
        pytest.skip(reason="Linux Block layer does not support fdp commands")

    err, _ = cijoe.run(f"xnvme_tests_fdp write_dir {cli_args}")
    assert not err

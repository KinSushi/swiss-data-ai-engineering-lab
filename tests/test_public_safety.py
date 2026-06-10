from tools.public_safety_check import main


def test_public_safety_check_passes():
    assert main() == 0

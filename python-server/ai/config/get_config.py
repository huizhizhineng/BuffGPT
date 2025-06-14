import os
from configparser import ConfigParser


class Configuration:
    def __init__(self, config_dict):
        for key, value in config_dict.items():
            if isinstance(value, dict):
                setattr(self, key, Configuration(value))  # 如果 value 是字典，递归创建 Configuration 实例
            else:
                setattr(self, key, value)


def get_config_parser() -> Configuration:
    # 创建 ConfigParser 对象
    config = ConfigParser()

    config_base_path = os.getenv("AI_CONFIG_PATH")
    if not config_base_path:
        config_base_path = os.path.dirname(os.path.abspath(__file__))

    if os.getenv("AI_ENV") == "pro":
        config_path = os.path.join(config_base_path, 'config_pro.ini')
    else:
        config_path = os.path.join(config_base_path, 'config.ini')
    config.read(config_path)
    config_data = dict()
    for section in config.sections():
        # 将每个部分的键值对存储到字典中
        config_dict = {key: config.get(section, key) for key in config.options(section)}
        config_data.update({section: config_dict})
    config_data = Configuration(config_data)
    return config_data


if __name__ == '__main__':
    data = get_config_parser()
    # {'redis_config': {'password': '', 'host': '118.31.112.25', 'port': '6379'}}
    print(data.redis_config.port)
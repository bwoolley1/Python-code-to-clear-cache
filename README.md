import os
import shutil

def clear_cache():
    try:
        # Paths to cache directories for Chrome and Firefox (Windows example)
        chrome_cache_path = os.path.join(os.getenv('LOCALAPPDATA'), 'Google', 'Chrome', 'User Data', 'Default', 'Cache')
        firefox_cache_path = os.path.join(os.getenv('APPDATA'), 'Mozilla', 'Firefox', 'Profiles')

        # Clear Chrome cache
        if os.path.exists(chrome_cache_path):
            shutil.rmtree(chrome_cache_path)
            print("Chrome cache cleared.")
        else:
            print("Chrome cache path not found.")

        # Clear Firefox cache (all profiles)
        if os.path.exists(firefox_cache_path):
            for profile in os.listdir(firefox_cache_path):
                profile_cache = os.path.join(firefox_cache_path, profile, 'cache2')
                if os.path.exists(profile_cache):
                    shutil.rmtree(profile_cache)
                    print(f"Firefox cache for profile {profile} cleared.")
                else:
                    print(f"No cache found for Firefox profile {profile}.")
        else:
            print("Firefox cache path not found.")
        
    except Exception as e:
        print(f"Error clearing cache: {e}")

if __name__ == "__main__":
    clear_cache()

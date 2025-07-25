#!/bin/zsh
# git worktrees
function wt() {
    NAME=$1
    if [ -z "$NAME" ]; then
        # If no argument is provided, show a list of existing worktrees to select from
        # or allow typing a new name
        echo "Select an existing worktree or type a new name:"
        NAME=$(cd $HOME/world/trees; find . -maxdepth 3 -name ".git" -type d -o -name ".git" -type f | sed 's/\/\.git$//' | sed 's/^\.\///' | fzf --print-query | tail -1)
    fi
    WD="$HOME/world/trees/$NAME"
    if [ ! -d "$WD" ]; then
        # Worktree doesn't exist, ask if user wants to create it
        read -q "REPLY?Worktree '$NAME' doesn't exist. Create it? (y/n) "
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # Check if main is already checked out in another worktree
            if (cd $HOME/world/git && git worktree list --porcelain | grep -q "refs/heads/main"); then
                echo "Branch 'main' is already checked out in another worktree."
                read "BRANCH?Enter a new branch name (will be created from main): "
                if [[ -z "$BRANCH" ]]; then
                    echo "No branch name provided. Cancelled."
                    return 1
                fi
                (cd $HOME/world/git; git worktree add --no-checkout -b "$BRANCH" "$WD/src" main && cd "$WD/src" && git sparse-checkout set && git checkout "$BRANCH")
            else
                (cd $HOME/world/git; git worktree add --no-checkout "$WD/src" main && cd "$WD/src" && git sparse-checkout set && git checkout main)
            fi
        else
            echo "Cancelled."
            return 1
        fi
    fi
    if [ -d "$WD/src" ]; then
        cd "$WD/src"
    else
        cd "$WD"
    fi
}

# Helper function to navigate to a specific directory in a git repository
# and add it to sparse checkout if needed
function goto_sparse_dir() {
    local target_path="$1"

    # Find our .git directory by traversing up
    local dir=$(pwd)
    while [[ "$dir" != "/" ]]; do
        if [[ -e "$dir/.git" ]]; then
            break
        fi
        dir=$(dirname "$dir")
    done

    if [[ "$dir" == "/" ]]; then
        echo "Not in a git repository"
        return 1
    fi

    # Check if target path is in sparse checkout
    local target_dir="$dir/$target_path"
    if [[ ! -d "$target_dir" ]]; then
        echo "Adding $target_path to sparse checkout"
        (cd "$dir" && git sparse-checkout add "$target_path")
    fi

    # cd to the target directory
    cd "$target_dir"
    echo "Changed to $(pwd)"
}

function core() {
    goto_sparse_dir "areas/core/shopify"
}

function sfr() {
    goto_sparse_dir "areas/core/storefront"
}

function admin() {
    goto_sparse_dir "areas/clients/admin-web"
}

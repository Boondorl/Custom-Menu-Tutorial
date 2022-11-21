version "4.9"

class CustomEpisodeMenu : ListMenu
{
    override void Init(Menu parent, ListMenuDescriptor desc)
    {
        // Remove the jank workaround
        if (desc)
        {
            desc.mYpos = 0;
            desc.mLinespacing = OptionMenuSettings.mLinespacing;
        }

        super.Init(parent, desc);
    }

    override void Drawer()
    {
        string label = "Episode: ";
        int indent = mDesc.mFont.StringWidth(label);
        int y;

        for (int i = 0; i < mDesc.mItems.Size(); ++i)
        {
            Screen.DrawText(mDesc.mFont, mDesc.mFontColor, 0, y, label, DTA_CleanTop, true);

            switch (mDesc.mItems[i].GetClassName())
            {
                // No picnum
                case 'ListMenuItemTextItem':
                    Screen.DrawText(mDesc.mFont, mDesc.mFontColor, indent, y, StringTable.Localize(ListMenuItemTextItem(mDesc.mItems[i]).mText), DTA_CleanTop, true);
                    break;

                // Picnum
                case 'ListMenuItemPatchItem':
                    Screen.DrawTexture(ListMenuItemPatchItem(mDesc.mItems[i]).mTexture, true, indent, y, DTA_CleanTop, true, DTA_TopLeft, true);
                    break;
            }

            y += mDesc.mLinespacing;
        }
    }
}
<!DOCTYPE html>
<html lang="{$CurrentLocale.Key}">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  {asset name="Head"}
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,700,700i" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.10/lodash.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>
</head>

{assign
"linkFormat"
"<div class='Navigation-linkContainer'>
  <a href='%url' class='Navigation-link %class'>
    %text
  </a>
</div>"
}
{capture name="menu"}
{if $User.SignedIn}
<div class="Navigation-row NewDiscussion">
  <div class="NewDiscussion mobile">
    {module name="NewDiscussionModule" reorder=$DataDrivenTitleBar}
  </div>
</div>
{else}
{if !$DataDrivenTitleBar}
<div class="Navigation-row">
  <div class="SignIn mobile">
    {module name="MeModule"}
  </div>
</div>
{/if}
{/if}

{if !$DataDrivenTitleBar}
{activity_link format=$linkFormat}
{categories_link format=$linkFormat}
{discussions_link format=$linkFormat}
{knowledge_link format=$linkFormat}
{custom_menu format=$linkFormat}


{/if}
{/capture}

{capture name="navLinks"}
{if !$DataDrivenTitleBar}
{activity_link format=$linkFormat}
{categories_link format=$linkFormat}
{discussions_link format=$linkFormat}
{custom_menu format=$linkFormat}

{/if}
{/capture}
{assign var="SectionGroups" value=(isset($Groups) || isset($Group))}
{assign var="TemplateCss" value="
{if $ThemeOptions.Options.hasHeroBanner}
ThemeOptions-hasHeroBanner
{/if}

{if $ThemeOptions.Options.hasFeatureSearchbox}
ThemeOptions-hasFeatureSearchbox
{else}
hideHomepageTitle
{/if}

{if $ThemeOptions.Options.panelToLeft}
ThemeOptions-panelToLeft
{/if}

{if $User.SignedIn}
UserLoggedIn
{else}
UserLoggedOut
{/if}

{if inSection('Discussion') and $Page gt 1}
isNotFirstPage
{/if}

{if inSection('Group') && !isset($Group.Icon)}
noGroupIcon
{/if}

locale-{$CurrentLocale.Lang}
"}

<body id="{$BodyID}" class="{$BodyClass}{$TemplateCss|strip:" "}">

  <!--[if lt IE 9]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

  <div class="Frame" id="page">

    {if $DataDrivenTitleBar}
    <header id="titleBar" data-react="title-bar-hamburger" style="display: none!important;" data-unhide="true">
      {$smarty.capture.menu}
    </header>
    {else}
    <div class="Frame-top">
      <div class="Frame-header">
        <!---------- Main Header ---------->
        <div class="HeaderWrap">
          <header id="tbHeader" class="tbHeader">
            <div></div>
            <div id="MobileNavTrigger" class="MobileNavTrigger">
              <button type="button">
                <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                  <g fill="#FFF" fill-rule="evenodd">
                    <path
                      d="M26.329 16.816H5.67a.671.671 0 110-1.342H26.33a.671.671 0 010 1.342zM26.329 8.843H5.67a.671.671 0 110-1.343H26.33a.671.671 0 010 1.343zM26.329 24.79H5.67a.671.671 0 110-1.343H26.33a.671.671 0 010 1.343z"
                    />
                    <path
                      d="M16.96 16l7.842-7.845a.677.677 0 00-.957-.957l-7.853 7.845L8.16 7.198a.686.686 0 00-.957 0 .666.666 0 000 .957L15.045 16l-7.842 7.845a.666.666 0 000 .957c.125.13.298.202.478.198.18 0 .352-.071.479-.198l7.832-7.845 7.842 7.845c.125.13.299.202.479.198.18 0 .351-.071.478-.198a.687.687 0 000-.957L16.96 16z"
                    />
                  </g>
                </svg>
              </button>    
            </div>

            <div class="Lockup"></div>

            <!-- logout -->
            <div id="login" class="ProfileTrigger hide"></div>

            <!-- login -->
            <div id="ProfileTrigger" class="ProfileTrigger" tabindex="-1">
              <button
                type="button"
                aria-label="Toggle Profile">
                <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><path d="M16.96 16l7.842-7.845a.677.677 0 00-.957-.957l-7.853 7.845L8.16 7.198a.686.686 0 00-.957 0 .666.666 0 000 .957L15.045 16l-7.842 7.845a.666.666 0 000 .957c.125.13.298.202.478.198.18 0 .352-.071.479-.198l7.832-7.845 7.842 7.845c.125.13.299.202.479.198.18 0 .351-.071.478-.198a.687.687 0 000-.957L16.96 16z" fill="#333"></path><circle stroke="#FF6E6E" stroke-width="2" cx="16" cy="16" r="15"></circle></g></svg>
              <img
                  src="https://qa-avatars.thebump.com/avatars/9353466736561127"
                  alt
                />
              </button>
            </div>

            <div id="Profile" class="Profile" >
              <div class="ProfileWrapper">
                <div class="MyOverview"></div>
                <div class="SignOut"></div>
              </div>
            </div>
            <div></div>
          </header>
        </div>
        <!---------- Main Header END ---------->

        <!---------- Left Nav ---------->


        <div id="SiteNavigation" class="SiteNavigation">
          <nav class="NavEl" id="NavEl">
            <div class="NavigationItemsContainer">
              <div class="TBSearchForm search__navigation">
                <form id="search_form_nav">
                  <label for="site__search___search__navigation">
                    <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                      <path
                        d="M12.512 21.707c-4.884 0-8.844-3.827-8.844-8.547 0-4.72 3.96-8.548 8.844-8.548 4.885 0 8.844 3.827 8.844 8.548 0 4.72-3.96 8.547-8.844 8.547m16.242 5.905l-8.172-7.946c1.523-1.763 2.442-4.03 2.442-6.506C23.024 7.549 18.317 3 12.512 3 6.707 3 2 7.549 2 13.16c0 5.61 4.707 10.159 10.512 10.159 2.638 0 5.043-.946 6.888-2.497l8.165 7.94a.86.86 0 001.189 0 .793.793 0 000-1.15"
                        fill="#FFF" fill-rule="evenodd" />
                    </svg>
                    <input type="search" aria-label="Search through site content" id="site__search___search__navigation"
                      name="site__search" placeholder="Search" value>
                  </label>
                </form>
              </div>
              <ul class="PrimaryNavigation">
                <li class="PrimaryNavTopLevelListItemWrap">
                  <div id="primaryMenuGettingPregnant">
                  </div>
                  <div class="Pane" id="gettingPregnantPane">
                  </div>
                </li>
                <li class="PrimaryNavTopLevelListItemWrap">
                  <div id="primaryMenuPregnancy">
                  </div>
                  <div class="Pane" id="pregnancyPane">
                  </div>
                </li>
                <div class="PopularLinks" id="popularLinksUnderPregnancy">
                </div>
                <li class="PrimaryNavTopLevelListItemWrap">
                  <div id="primaryMenuBaby">
                  </div>
                  <div class="Pane" id="babyPane">
                  </div>
                </li>
                <div class="PopularLinks" id="popularLinksUnderBaby">
                </div>
                <li class="PrimaryNavTopLevelListItemWrap" id="primaryMenuToddler">
                  <div class="Pane" id="toddlerPane">
                  </div>
                </li>
                <div class="PopularLinks" id="popularLinksUnderToddler">
                </div>
                <li class="PrimaryNavTopLevelListItemWrap" id="primaryMenuParents">
                  <div class="Pane" id="parentsPane">
                  </div>
                </li>
                <li class="PrimaryNavTopLevelListItemWrap" id="primaryMenuBabyProducts">
                  <div class="Pane" id="babyProductsPane">
                  </div>
                </li>
              </ul>
              <div id="secondaryNavigationAtLast">
              </div>
              <div class="SocialLinks social_links__navigation">
                <a class="SiteNavHref" href="https://www.facebook.com/TheBump" target="_blank"
                  rel="nofollow noopener noreferrer">
                  <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M19.433 6.1h4.1V0h-4.85c-5.85.25-7.05 3.55-7.15 7v3.05h-4V16h4v16h6V16h4.95l.95-5.95h-5.9V8.2a1.981 1.981 0 011.9-2.1z"
                      fill="#FF6E6E" fill-rule="nonzero" />
                  </svg>
                </a>
                <a class="SiteNavHref" href="https://www.instagram.com/TheBump" target="_blank"
                  rel="nofollow noopener noreferrer">
                  <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M4.037 0H27.47a3.933 3.933 0 014.037 4.037V27.47a3.933 3.933 0 01-4.037 4.037H4.037A3.933 3.933 0 010 27.47V4.037A3.933 3.933 0 014.037 0zm18.905 3.495c-.789 0-1.428.64-1.428 1.428V8.32c0 .788.639 1.428 1.428 1.428h3.544c.789 0 1.428-.64 1.428-1.428V4.923c0-.788-.64-1.428-1.428-1.428h-3.544zm5.021 9.847h-2.757c.258.879.391 1.79.394 2.707 0 5.219-4.382 9.502-9.797 9.502-5.415 0-9.797-4.234-9.797-9.502a9.727 9.727 0 01.394-2.707H3.495v13.292a1.22 1.22 0 001.231 1.23h21.957a1.22 1.22 0 001.23-1.23l.05-13.292zM15.803 9.55a6.264 6.264 0 00-6.35 6.154 6.223 6.223 0 006.35 6.104 6.264 6.264 0 006.35-6.154 6.223 6.223 0 00-6.35-6.104z"
                      fill="#FF6E6E" fill-rule="nonzero" />
                  </svg>
                </a>
                <a class="SiteNavHref" href="https://www.pinterest.com/thebump" target="_blank"
                  rel="nofollow noopener noreferrer">
                  <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M16.001 0a16.009 16.009 0 00-6.35 30.7 13.18 13.18 0 01.3-3.65c.3-1.3 2.05-8.75 2.05-8.75a6.469 6.469 0 01-.5-2.55c0-2.4 1.4-4.15 3.1-4.15 1.45 0 2.15 1.1 2.15 2.4 0 1.45-.95 3.65-1.4 5.7a2.494 2.494 0 002.55 3.1c3.05 0 5.1-3.9 5.1-8.55 0-3.5-2.35-6.15-6.7-6.15-4.85 0-7.9 3.65-7.9 7.7a4.588 4.588 0 001.05 3.15.803.803 0 01.25.9c-.1.3-.25 1-.35 1.3a.555.555 0 01-.8.4c-2.25-.9-3.3-3.35-3.3-6.15 0-4.55 3.85-10.05 11.5-10.05 6.15 0 10.15 4.45 10.15 9.2 0 6.3-3.5 11-8.65 11-1.75 0-3.35-.95-3.9-2 0 0-.95 3.7-1.15 4.4-.38 1.2-.918 2.343-1.6 3.4a14.2 14.2 0 004.4.65c8.837 0 16-7.163 16-16s-7.163-16-16-16z"
                      fill="#FF6E6E" fill-rule="nonzero" />
                  </svg>
                </a>
                <a class="SiteNavHref" href="https://www.twitter.com/thebump" target="_blank"
                  rel="nofollow noopener noreferrer">
                  <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M32 6.3a11.55 11.55 0 01-3.65 1.05 7.06 7.06 0 002.75-3.6c-.95.6-3.05 1.45-4.1 1.45a6.891 6.891 0 00-4.8-2 6.594 6.594 0 00-6.6 6.6c-.002.487.048.973.15 1.45C10.8 11.1 5 8.65 1.75 4.4a6.603 6.603 0 002 8.7c-.75.1-2.2-.05-2.85-.7-.05 2.3 1.05 5.35 5.1 6.45-.8.4-2.15.3-2.75.2.2 1.95 2.95 4.5 5.9 4.5C8.1 24.75 4.5 27 0 26.3c3.119 1.897 6.7 2.9 10.35 2.9a18.4 18.4 0 0018.5-19.3v-.25A11.43 11.43 0 0032 6.3z"
                      fill="#FF6E6E" fill-rule="nonzero" />
                  </svg>
                </a>
              </div>
              <div class="DownloadAppPromo">
                <div>
                  <img
                    src="data:image/png;base64,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"
                    alt="The Bump App on iPhone">
                  <div>
                    <p><span>Download The App</span>to explore more tools like Planner+ and Food Safety.</p>
                    <span><a href="https://bump.onelink.me/5bsp?pid=VHP" target="_blank" rel="noopener noreferrer">Get
                        the
                        Bump App</a><a href="https://app.appsflyer.com/com.xogrp.thebump" target="_blank"
                        rel="noopener noreferrer"><img
                          src="data:image/png;base64,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"
                          alt="Download The Bump App from Google Play"></a><a
                        href="https://app.appsflyer.com/id568940747" target="_blank" rel="noopener noreferrer"><img
                          src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALAAAAA0CAYAAAAqlrKQAAAABGdBTUEAALGPC/xhBQAAFQ1JREFUeAHtnQVwHMcShkeKQw4zJwozYwUVZmZ0mJk5DmOFHGZmZrbDzMzMzOx5/9dx75vbrKyTtBcp8XbVaWG4t6enaUZNIYGbb755kj///HOzH374YfOff/55rIEDByap1W2Fge7DwNBDDx1GGmmke4YZZpiDl19++QHekya/ueaaayDcA++9997x7r///vDNN994UnWtMNDtGBhqqKHC1FNPHZZYYolfdT2/V69eu6644orfW8euuuqq3c4777w4yyyzRL2ofhUOeiwNDD/88HGXXXaJV1999Vmi1aamiy++eC6x5f5nn31279tuu63bZ1rVgQoD7WFARBwOOuiggVNNNdXKzWLFR3/22We977vvvvbKVekVBnoEBqSfhQEDBjT//vvv+zVLtljw/fffDz/99FOP6FzViQoD9WDg1VdfDTI4zNEcYwz8Kqgw8G/CgLiv0W1zT+v0OOOMg7mkp3Wr6k8Pw0BT018GtB5DwEsuuWSQKS889dRTYeWVVy4VXS0tLWH++ecPra2tYcEFFwxTTjllqfXXWxljvOSSS8K4445bb5G68k0xxRRBlqQw22yz1ZW/7Ex77713OPjgg8uutq76up2ARx555HD66acHOVGMcMcff/yAkF4mHHLIIQHb9plnnhmuuOKK8MQTT4TrrrsuTDzxxGU2025d0prD2muvXfoKM8YYY4RVV101TDjhhO32oasZWB0XWGCBMNxww2VVLbroothns+d/8qZbCRgkQLybb755wFAN/Pjjj+HFF18sFQe089xzz4U55pgjzDTTTGHLLbcMIP3CCy8MvXv3rmlrlFFGCUyqFCiPJ8hBZsfQ3PwX6ljKMOvImiOjZFMYdthhLRv15kWhP/74wyZnXuegPdotAt6POuqoRUnWd9KlzFi6Xwsz62XR2BgH/Qe45vtsCYP+8I023XTTcOutt4aJJprIxkzSr7/+akYAxk9fHTdpWfA3+uijB3BXJnQrAW+22WZhrbXWqhnPAw88EF555ZWad2U8/Pbbb+Hbb78NMhmGSy+9NOyzzz4mTsw111xW/dhjjx0uuuii8Pzzz9sEOvfcc8NYY41laUcddVS48sor7YPxgeDmW2yxhaUtt9xy4ZFHHgkTTDBBmGaaaQLmyKOPPjq88MIL4c033wy77rqrEXbRGGhT9ndr7+WXXw4XXHBBGHPMMS0rxMZqgUgFPs4//3wjAK+H9pnolDvuuOPsdX5ieF7qlKMqy0876BrAJJNMEuR9DUcccUR45plnwltvvRX69u2bMRSvgytcdr/99gsjjDCCEfFGG21kyUwcVs5bbrklvPvuu+H22283Avey8803X3jooYdsLI899pgxD0/r8lUfJu6xxx7/uOdFXCe+/vrrwvn/QaJDXGihhUrvi+TDKLEhikNkdc8666zWsAjB3l1++eXxyy+/jMsss0zUpIrScuMZZ5xhadttt10U94zjjTdeXHrppa1c//79rT6tIFEmnSiuE+eee25L0ySIq6yySrzhhhuiJk4UYVs9W221VZS5MkpmtbKaJPG7776LcolGyf2WplXB0sTJ45prrhlnnnnmuPrqq1u922yzjdUz77zzWn9E1HHxxRePN910k6XTdxFEzY8xa8JGTd6oyWZ10ifaJm2yySaLv/zyS3z77bejxJCoSRwVAxM1sWvqoV7Gf84551j+DTbYIE4++eSW5/rrr7f+7LXXXhF8AkceeaSlaWLHDz74IJ588slRIlTUpIyvvfZa5Pvn+9qRZ+k18bLLLotwlm4hYCk0NtD0z2677dalQbWFgCICljhhTffp0yeK09pH2X///bP2xbHiV199FSEk+d4tHeIVt4sSR6Js51HKYBSnjZKxrRwELG4U+bj0RYqjtbHYYovZsxMwRDPiiCNGxZ7EY489NmvzpJNOit9//32UkmfvZphhhnj44YfHG2+8MWqZjocddpi9F4ePX3/9dRQHt+d55pnH2ll22WWzuhwXEJDEsnjMMcdkaRAhE0ecNE466aQRxrHzzjtbOpMNkKye5fe6uO6www5Wn+TuLF2cN4qzZs8wC/pM/jXWWMPqo+/bbrutTRxe+KRO6+7IvRNwt4kQLLcO7733nslWLL2NBOEtq36RRRaxe0QGxALku48++ihL//TTT03GRP5FFGC5xjqCNUOEFkTcYeONNw4oUMiEDrSBHA94e371PFxpj7o//vjj7DX3yNDI05oM4cEHHwzTTz99EDGETz75JJMtkSVF6PajMDJoW4BMS31pOz421zvonyvOyOkA8mwRuC7gV8/j5XlGXPNIRpffNVHCnHPOaTg57bTTSgsW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"
                          alt="Download The Bump App from the Apple App Store"></a></span>
                  </div>
                </div>
              </div>
            </div>
          </nav>
        </div>

        <!---------- Left Nav END ---------->

        <button id="background" class="background"></button>
      </div>
      {/if}
      <div class="Frame-body">

        <!---------- Hero Banner ---------->
        {if $ThemeOptions.Options.hqwertasHeroBanner && inSection(["CategoryList", "DiscussionList",
        "CategoryDiscussionList"])}
        <div class="Herobanner">
          {if {banner_image_url}}
          <div class="Herobanner-bgImage" style="background-image:url('{banner_image_url}')"></div>
          {/if}
          <div class="Container">
            {if $ThemeOptions.Options.hasFeatureSearchbox}
            <div class="SearchBox js-sphinxAutoComplete" role="search">
              {if $hasAdvancedSearch === true}
              {module name="AdvancedSearchModule"}
              {else}
              {searchbox}
              {/if}
            </div>
            {else}
            {if $Category}
            <h2 class="H HomepageTitle">{$Category.Name}{follow_button}</h2>
            <p class="P PageDescription">{$Category.Description}</p>
            {else}
            {if {homepage_title} !== ""}
            <h2 class="H HomepageTitle">{homepage_title}</h2>
            {/if}
            {if $_Description}
            <p class="P PageDescription">{$_Description}</p>
            {/if}
            {/if}
            {/if}
          </div>
        </div>
        {/if}
        <!---------- Hero Banner END ---------->

        <div class="Frame-content">
          <div class="Container">
            <div class="Frame-contentWrap">
              <div class="Frame-details">
                {if !$isHomepage}
                <div class="Frame-row">
                  <nav class="BreadcrumbsBox">
                    {breadcrumbs}
                  </nav>
                </div>
                {/if}
                {if !$DataDrivenTitleBar}
                <div class="Frame-row SearchBoxMobile">
                  {if !$SectionGroups && !inSection(["SearchResults"])}
                  <div class="SearchBox js-sphinxAutoComplete" role="search">
                    {if $hasAdvancedSearch === true}
                    {module name="AdvancedSearchModule"}
                    {else}
                    {searchbox}
                    {/if}
                  </div>
                  {/if}
                </div>
                {/if}
                <div class="Frame-row">

                  <!---------- Main Content ---------->
                  <main class="Content MainContent">
                    <!---------- Profile Page Header ---------->
                    {if inSection("Profile")}
                    <div class="Profile-header">
                      <div class="Profile-photo">
                        <div class="PhotoLarge">
                          {module name="UserPhotoModule"}
                        </div>
                      </div>
                      <div class="Profile-name">
                        <div class="Profile-row">
                          <h1 class="Profile-username">
                            {$Profile.Name|escape:'html'}
                          </h1>
                        </div>
                        <div class="Profile-row">
                          {if isset($Rank)}
                          <span class="Profile-rank">
                            {$Rank.Label}
                          </span>
                          {/if}
                        </div>
                      </div>
                    </div>
                    {/if}
                    <!---------- Profile Page Header END ---------->

                    {asset name="Content"}
                  </main>
                  <!---------- Main Content END ---------->

                  <!---------- Main Panel ---------->
                  <aside class="Panel Panel-main">
                    {if !$SectionGroups && !$DataDrivenTitleBar}
                    <div class="SearchBox js-sphinxAutoComplete" role="search">
                      {searchbox}
                    </div>
                    {/if}
                    {asset name="Panel"}
                  </aside>
                  <!---------- Main Panel END ---------->

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="Frame-footer">

      <!---------- Main Footer END ---------->
      <footer id="tbFooter" class="footer">
        <div class="FooterColumn">
          <section class="topArticles"></section>
          <section class="registryBabyGear"></section>
        </div>
        <div class="FooterColumn">
          <section class="toolsResources"></section>
          <section class="aboutTheBump"></section>
        </div>
        <div class="FooterColumn">
          <section class="app"></section>
          <section>
            <span class="title followUs">Follow Us</span>
            <div class="SocialLinks">
              <a
                href="https://www.facebook.com/TheBump"
                target="_blank"
                rel="nofollow noopener noreferrer"
                ><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M19.433 6.1h4.1V0h-4.85c-5.85.25-7.05 3.55-7.15 7v3.05h-4V16h4v16h6V16h4.95l.95-5.95h-5.9V8.2a1.981 1.981 0 011.9-2.1z"
                    fill="#FF6E6E"
                    fill-rule="nonzero"
                  /></svg></a
              ><a
                href="https://www.instagram.com/TheBump"
                target="_blank"
                rel="nofollow noopener noreferrer"
                ><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M4.037 0H27.47a3.933 3.933 0 014.037 4.037V27.47a3.933 3.933 0 01-4.037 4.037H4.037A3.933 3.933 0 010 27.47V4.037A3.933 3.933 0 014.037 0zm18.905 3.495c-.789 0-1.428.64-1.428 1.428V8.32c0 .788.639 1.428 1.428 1.428h3.544c.789 0 1.428-.64 1.428-1.428V4.923c0-.788-.64-1.428-1.428-1.428h-3.544zm5.021 9.847h-2.757c.258.879.391 1.79.394 2.707 0 5.219-4.382 9.502-9.797 9.502-5.415 0-9.797-4.234-9.797-9.502a9.727 9.727 0 01.394-2.707H3.495v13.292a1.22 1.22 0 001.231 1.23h21.957a1.22 1.22 0 001.23-1.23l.05-13.292zM15.803 9.55a6.264 6.264 0 00-6.35 6.154 6.223 6.223 0 006.35 6.104 6.264 6.264 0 006.35-6.154 6.223 6.223 0 00-6.35-6.104z"
                    fill="#FF6E6E"
                    fill-rule="nonzero"
                  /></svg></a
              ><a
                href="https://www.pinterest.com/thebump"
                target="_blank"
                rel="nofollow noopener noreferrer"
                ><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M16.001 0a16.009 16.009 0 00-6.35 30.7 13.18 13.18 0 01.3-3.65c.3-1.3 2.05-8.75 2.05-8.75a6.469 6.469 0 01-.5-2.55c0-2.4 1.4-4.15 3.1-4.15 1.45 0 2.15 1.1 2.15 2.4 0 1.45-.95 3.65-1.4 5.7a2.494 2.494 0 002.55 3.1c3.05 0 5.1-3.9 5.1-8.55 0-3.5-2.35-6.15-6.7-6.15-4.85 0-7.9 3.65-7.9 7.7a4.588 4.588 0 001.05 3.15.803.803 0 01.25.9c-.1.3-.25 1-.35 1.3a.555.555 0 01-.8.4c-2.25-.9-3.3-3.35-3.3-6.15 0-4.55 3.85-10.05 11.5-10.05 6.15 0 10.15 4.45 10.15 9.2 0 6.3-3.5 11-8.65 11-1.75 0-3.35-.95-3.9-2 0 0-.95 3.7-1.15 4.4-.38 1.2-.918 2.343-1.6 3.4a14.2 14.2 0 004.4.65c8.837 0 16-7.163 16-16s-7.163-16-16-16z"
                    fill="#FF6E6E"
                    fill-rule="nonzero"
                  /></svg></a
              ><a
                href="https://www.twitter.com/thebump"
                target="_blank"
                rel="nofollow noopener noreferrer"
                ><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M32 6.3a11.55 11.55 0 01-3.65 1.05 7.06 7.06 0 002.75-3.6c-.95.6-3.05 1.45-4.1 1.45a6.891 6.891 0 00-4.8-2 6.594 6.594 0 00-6.6 6.6c-.002.487.048.973.15 1.45C10.8 11.1 5 8.65 1.75 4.4a6.603 6.603 0 002 8.7c-.75.1-2.2-.05-2.85-.7-.05 2.3 1.05 5.35 5.1 6.45-.8.4-2.15.3-2.75.2.2 1.95 2.95 4.5 5.9 4.5C8.1 24.75 4.5 27 0 26.3c3.119 1.897 6.7 2.9 10.35 2.9a18.4 18.4 0 0018.5-19.3v-.25A11.43 11.43 0 0032 6.3z"
                    fill="#FF6E6E"
                    fill-rule="nonzero"
                  /></svg></a>
            </div>
            <span class="Copyright">&#xA9;2020 The Bump</span>
          </section>
        </div>
      </footer>
      <!---------- Main Footer END ---------->

    </div>
  </div>
  <div id="modals"></div>
  {event name="AfterBody"}
</body>

</html>
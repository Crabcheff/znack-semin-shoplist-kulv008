<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/users">
        <html>
            <head>
                <title>Shopping Lists</title>
                <style>
					.name {
						display: inline-flex;
						gap: 5px;
					}

                    .surname {
						display: inline-flex;
						gap: 5px;
                        margin-left: 3px;  
                        padding-left: 3px;
					}

					.border-with-padding-user {
						border: 5px solid black;
						padding: 1px;
					}

                    .border-with-padding {
						border: 1px solid black;
						padding: 1px;
                        flex-basis: 2px;
                        align-content: space-around;
                        gap: 10px 30px;
					}

					.favourite {
						margin-left: 0.5px;
					}

					.group-title {
						display: inline-flex;
						align-items: center;
						gap: 3px;
					}

                    .spacer { 
                        margin-left: 5px;  
                        padding-left: 5px;  
                    }

                </style>
            </head>
            <body>
                <h2>Nakupující</h2>
                <xsl:for-each select="user">
                    <div class="border-with-padding-user">
                        <div class="card">
                            <h3 class="name">
                                <span>
                                    <xsl:value-of select="first_name" />
                                </span>
                                <span class="surname">
                                    <xsl:value-of select="surname" />
                                </span>
                            </h3>
                            <ul>
                                <li>telefon: <xsl:value-of select="phone" />
                                </li>
                            </ul>
                        </div>
                        <xsl:for-each select="stores">
                            <h2>Kde nakupuje:</h2>
                            <xsl:for-each select="store">
                                <div class="border-with-padding">
                                    <div class="store">
                                        <h3>
                                            <xsl:value-of select="name" />
                                        </h3>
                                        <ul>
                                            <li>
												adresa:
                                                <xsl:value-of select="address" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="items">
                            <h2>Položky</h2>
                            <xsl:for-each select="item">
                                <div class="border-with-padding">
                                    <h3>
                                        <xsl:value-of select="name" />
                                        <xsl:if test="@favourite='true'">
                                            <span class="favourite">&#9733;</span>
                                        </xsl:if>
                                    </h3>
                                    <ul>
                                        <li>
											id: <xsl:value-of select="id" />
                                        </li>
                                        <li>
											cena:
                                            <xsl:value-of select="price" />
                                        </li>
                                        <li>
											store_id:
                                            <xsl:value-of select="store_id" />
                                        </li>
                                    </ul>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="shopping_lists">
                            <h2>Nákupní seznam</h2>
                            <xsl:for-each select="shopping_list">
                                <xsl:sort select="created" />
                                <div class="border-with-padding">
                                    <h3>
                                        <xsl:value-of select="name" />
                                    </h3>
                                    <ul>
                                        <li>
											id: <xsl:value-of select="id" /> <!--cislo seznamu-->
                                        </li>
                                        <li>
											vystaveno:
                                            <xsl:value-of select="created" />
                                        </li>
                                        <li>
											nakoupeno:
                                            <xsl:choose>
                                                <xsl:when test="@finished='true'">
                                                    <span>&#x2713;</span> <!--Unicode check-->
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="spacer">
                                                        <button>
															Hotovo
                                                        </button>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </li>
                                        <li>
											Schváleno ke koupi: <!--Strict wife-->
                                            <xsl:value-of select="created" />
                                            <xsl:choose>
                                                <xsl:when test="@approved='true'">
                                                    <span>&#x2713;</span> <!--Unicode check-->
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="spacer">
                                                        <button>
															Schválit
                                                        </button>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </li>
                                    </ul>
                                    <div class="groups">
                                        <xsl:for-each select="groups">
                                            <h3>Nakoupit:</h3>
                                            <xsl:for-each select="group">
                                                <div class="border-with-padding">
                                                    <div class="group-title">
                                                        <h3>
                                                            <xsl:value-of select="item/name" />
                                                        </h3>
                                                        <div class="group-check">
                                                            <xsl:choose>
                                                                <xsl:when test="@checked='true'">
                                                                    <span>&#x2713;</span> <!--Unicode check-->
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <span class="spacer">
                                                                        <button>
																			Koupeno
                                                                        </button>
                                                                    </span>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </div>
                                                    </div>
                                                    <ul>
                                                        <li>
															id:
                                                            <xsl:value-of select="id" />
                                                        </li>
                                                        <li>
															množství:
                                                            <xsl:value-of select="amount" />
                                                        </li>
                                                        <li>
															cena:
                                                            <xsl:value-of select="item/price" />
                                                        </li>
                                                    </ul>
                                                </div>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

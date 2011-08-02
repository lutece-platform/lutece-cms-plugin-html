--
-- Dumping data for table core_portlet
--
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (57,'HTML_PORTLET',5,'Le projet','2011-11-24 17:18:33',0,2,1,104,0,'2011-03-14 16:17:30',1);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (55,'HTML_PORTLET',1,'Lutèce v3.0','2011-11-24 16:24:51',0,1,2,104,0,'2011-03-14 16:13:39',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (61,'HTML_PORTLET',9,'Publication d''agendas','2011-11-24 17:24:11',0,1,1,104,0,'2011-03-14 16:35:35',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (64,'HTML_PORTLET',10,'Infos développeurs','2011-11-24 17:26:41',0,1,1,104,0,'2011-03-14 16:45:14',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (65,'HTML_PORTLET',10,'Liens développeurs','2011-11-24 17:26:05',0,1,2,104,0,'2011-03-14 16:49:18',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (58,'HTML_PORTLET',3,'Accès à la documentation technique','2011-11-24 17:19:26',0,2,1,104,0,'2011-03-14 16:20:08',1);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (66,'HTML_PORTLET',10,'Tests unitaires','2011-11-24 17:26:24',0,2,3,104,0,'2011-03-14 17:10:26',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (90,'HTML_PORTLET',5,'Liste des plugins','2009-05-13 19:41:18',0,1,2,104,0,'2009-05-13 19:40:13',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (91,'HTML_PORTLET',1,'Back office','2009-05-15 10:38:08',0,1,3,100,0,'2009-05-15 10:38:08',1);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (92,'HTML_PORTLET',1,'Qui utilise Lutèce ?','2009-05-20 12:54:42',0,1,1,100,0,'2009-05-19 14:21:02',0);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (93,'HTML_PORTLET',1,'Presentation google map','2009-06-11 13:11:36',0,2,3,100,0,'2009-06-11 13:11:36',1);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (95,'HTML_PORTLET',6,'Ajouter du contenu dans Lutece','2009-06-17 09:06:58',0,1,1,100,0,'2009-06-17 09:06:58',1);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (96,'HTML_PORTLET',11,'Info','2009-06-24 10:47:26',0,1,2,100,0,'2009-06-24 10:42:42',1);
INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title)
	VALUES (97,'HTML_PORTLET',12,'Générateur de code','2009-07-13 13:50:26',0,1,1,100,0,'2009-07-13 13:50:26',0);

--
-- Dumping data for table `html_portlet`
--
INSERT INTO html_portlet (id_portlet, html) VALUES (55,'<p>Lutèce est un moteur de portail libre, qui permet de créer rapidement un site internet ou intranet dynamique basé sur du contenu HTML, XML... </p><p>Lutèce fournit une interface d''administration très simple de qualité professionnelle qui peut être utilisée par des utilisateurs qui n''ont pas de compétences techniques particulières.<br />L''administrateur du site à accès à un ensemble de fonctionnalités avancées : définition dynamique des types de contenu (sans programmation), workflow et règles de notification paramétrables en ligne, installation de plugins, interface de prévisualisation des pages du site, avec possibilité de suspendre à la publication des blocs de contenu, affichage et production de fils RSS, lettre d''information, calendrier, gestion électronique des ressources documentaires insérés dans les rubriques de type référentiels de contenus JSR170 : JCR JackRabbit et interface avec Alfresco (avec versionning et indexation).... La palette de services offerts sur un site peut être facilement personnalisé, il suffit d''ajouter un ou des plugins pour accéder à de nouvelles fonctionnalités.</p>');
INSERT INTO html_portlet (id_portlet, html) VALUES (57,'<p>A la fin de l''année 2000, la mairie de Paris a entamé le développement d''un outil d''administration et de mise en ligne de portails internet à destination des mairies d''arrondissement.<br /> Développée pour la création et l''administration de portails institutionnels, l''application a été adaptée pour un usage plus général et a été nommée Lutèce.<br /><br />Lutèce est un outil permettant la réalisation d''un portail internet ou intranet offrant les fonctionnalités suivantes :<br />* Publication et aggrégation de contenu,<br />* Recherche en texte intégral sur l''ensemble du site,<br />* Lettre d''information,<br /> * Administration dynamique...</p><div class="portlet-content portlet-content"><br /><h3>Organisation du portail</h3><ul><li>Un site conçu à partir de Lutèce se présente sous la forme d''une arborescence dynamique de pages, dont la racine est la page d''accueil.</li><li>L''information présentée dans chacune des pages du portail s''organise à l''intérieur de blocs appelés rubriques de page. Ces rubriques de page constituent des zones de texte qui vont pouvoir être placées dynamiquement à l''intérieur d''une page par le webmestre au moment de la conception et de la mise à jour des pages. Chaque page est associée à un modèle de composition composé de lignes et de colonnes.</li><li>Les données techniques relatives à l''organisation d''un site (pages, rubriques, types de contenu, feuilles de style,... ) sont stockées en base de données.</li><li style="list-style-type: none; list-style-image: none; list-style-position: outside;"></li></ul><br /><h3>Navigation</h3><ul><li>Les pages principales du site sont regroupées dans une barre de navigation toujours visible.</li><li>L''accès direct aux pages intérieures se fait à partir de menus déroulants associés à chacune des pages principales du site.</li><li>Un chemin de navigation interactif est présent sur chacune des pages visitées</li><li>La navigation dans l''arborescence du site se fait également à partir de liens placés directement dans les pages (liens vers les pages filles).</li><li>Le plan du site, généré dynamiquement, permet l''accès direct aux pages du site</li><li style="list-style-type: none; list-style-image: none; list-style-position: outside;"></li></ul><br /><h3>Services</h3><ul><li>La gestion d''un ensemble de services est assurée par des pages spéciales, toujours visibles (moteur de recherche, plan du site, forum, chat, lettres d''information, contacts, liens vers d''autres sites Internet).</li><li>Certains produits logiciels disponibles en « Open Source » ont été intégrés sous la forme de services (indexation full-text et moteur de recherche, forum modéré).</li><li>Rubriques de page et types de contenu</li><li>Les rubriques de page, dans lesquelles vont se placer le contenu web, ont des types prédéfinis, déterminés par le type de contenu lui-même. Les types de rubriques disponibles sont : Liste d''articles (actualités, agenda, ...), fiche de renseignements, texte libre ou HTML, document au format XML, liste de personnes, fichiers à télécharger, liste de liens Internet, liste de liens pour la navigation intérieure, syndication de contenu externe (au format RSS).</li><li>Le placement de ces rubriques dans une page suit le modèle de composition de la page, qui s''organise en lignes et en colonnes.</li><li>Séparation entre contenu et présentation</li><li>La séparation entre le contenu et la mise en forme est rendue possible par le choix du format d''échange XML, dans lequel sont traduites les informations structurées issues de la base de données.</li><li>L''affichage dynamique du contenu des pages est assuré par la transformation XSLT du contenu XML généré et des feuilles de style XSL associées à chacune des rubriques.</li><li>Des modèles de mise en page de contenu sont définis pour chaque type de rubrique et peuvent être complétés au fur et à mesure des besoins.</li><li>Tant que le contenu d''une page n''est pas modifié, celle-ci n''est pas recalculée (gestion intégrée du cache).</li></ul><br /><h3>Outil d''administration pour la mise en page des rubriques</h3><ul><li>l''outil d''administration du portail est destiné aux webmestres et aux assistants de publication.</li><li>Cet outil a été conçu pour être simple à utiliser, et n''exige pas d''avoir de compétences techniques spéciales.</li><li>Un ensemble d''interfaces graphiques assiste le webmestre dans la création des pages, le choix des rubriques, la saisie ou la publication de contenus, le choix du style de présentation.</li><li>Une fenêtre de prévisualisation permet au webmestre d''afficher la page sur laquelle il travaille et d''agir directement sur son contenu.</li><li>La construction des pages du portail et la mise à jour des contenus se font dans un environnement de pré-production.</li><li>La mise en ligne des ajouts ou modifications apportées en pré-production se fait après validation du webmestre.</li></ul><br /><h3>Outils d''administration des services</h3><ul><li>Le webmestre dispose d''une interface graphique pour animer et modérer les groupes de discussion du portail (produit Open Source Jive).</li><li>Le webmestre peut créer une ou plusieurs lettres d''information thématiques, associées chacune à un ou plusieurs thèmes d''articles. Le contenu d''une lettre est généré à partir de la liste d''articles publiés sur les thèmes choisis dans les rubriques du portail depuis le dernier envoi. L''envoi d''une lettre est déclenché par l''action du webmestre.</li><li>La liste des personnes à contacter depuis le portail est également géré depuis l''outil d''administration.</li><li style="list-style-type: none; list-style-image: none; list-style-position: outside;"></li><li>Outil de création de comptes utilisateurs</li><li>Un profil « administrateur » permet de créer les comptes de webmestres et de contributeurs externes.</li><li>Le profil « webmestre » permet de créer l''ensemble des comptes utilisateurs amenés à produire du contenu ou à l''assister dans la publication.</li><li>Chaque compte utilisateur est rattaché à un compte de fournisseurs de contenu, auquel est attribué un ou plusieurs flux d''information. Le flux d''information sert à définir un contexte propre à chaque fournisseur (portée de l''information, type et origine de l''information).</li></ul><br /><h3>Outil de production de contenu</h3><ul><li>Les outils de production de contenu sont destinés aux webmestres et aux différents contributeurs externes.</li><li>La production de contenu consiste en la saisie d''articles ou de fiches de renseignement, à l''aide d''un éditeur de texte intégré. Une image peut être associée à chaque contenu produit.</li><li>Les contenus sont produits sans indication de leur mise en page future (principe de la séparation entre contenu et mise en forme).</li><li>Une bibliothèque d''images permet au webmestre de charger et de stocker les images qu''il souhaite placer dans les rubriques de texte de son portail.</li></ul><br /><h3>Outil de publication de contenu</h3><ul><li style="list-style-type: none; list-style-image: none; list-style-position: outside;">­</li><li>L''outil de publication de contenus web dans les pages du site est destiné au webmestre et aux assistants de publication. Cet outil permet de mettre à la disposition du webmestre l''ensemble des contenus produits par les contributeurs et de lui en donner un aperçu avant qu''il ne les place lui-même dans son portail.</li><li>La publication consiste à associer un article à une ou plusieurs rubriques de page destinées à recevoir ce type de contenu (liste d''articles ou fiche de renseignements).</li><li>Un article peut être publié à plusieurs endroits du site, et se présenter sous différentes formes (titre seulement ; titre, image et résumé ; titre, dates de début et de fin)</li><li>La validité d''un article est gérée au niveau de ses propriétés et conditionne son affichage.</li><li>Il est possible d''associer un flux d''information à une rubrique de page, pour rendre automatique la publication des contenus produits sur ce flux dans la rubrique.</li></ul></div>');
INSERT INTO html_portlet (id_portlet, html) VALUES (58,'<p>La documentation technique de Lutèce est rédigée au format XML et générée en fichiers HTML et PDF à l''aide de l''outil <a target="_blank" href="http://maven.apache.org/">Maven</a>.</p><a target="_blank"href="http://dev.lutece.paris.fr/fr/">Accès au site de documentation technique</a>');
INSERT INTO html_portlet (id_portlet, html) VALUES (61,'Le plugin <strong>calendar</strong> permet d''afficher sur un calendrier à trois vues (jour, semaine, mois) les événements concernant un ou plusieurs agendas simultanément. Les formats supportés pour les agendas sont soit texte, soit iCalendar ( <a href="http://www.ietf.org/rfc/rfc2445.txt" target="_blank" title="Spécifications iCalendar">RFC 2445</a>)<form action="jsp/site/Portal.jsp"><div style="text-align: center;"><input value="calendar" name="page" type="hidden" /><input value="projet1" name="agenda" checked="true" type="checkbox" />Projet 1 (Fichier .ics) <input value="projet2" name="agenda" checked="true" type="checkbox" />Projet2 (Fichier .txt) <input value="Afficher les agendas" name="Submit" type="submit" /></div></form>');
INSERT INTO html_portlet (id_portlet, html) VALUES (64,'<h3>Normes de développement</h3><p>Le développement sous Lutèce est soumis à un ensemble de règles qui permettent de garantir l''homogénéité et la maintenabilité du code. L''ensemble de ces règles est décrit dans le document disponible ci-dessous.</p><h3>API de Lutece</h3><p>Les documentations disponibles sont :</p><ul><li><a target="_blank" href="http://dev.lutece.paris.fr/fr/" title="Guide du développeur">Guide du développeur</a></li><li><a target="_blank" href="http://dev.lutece.paris.fr/lutece-core/fr/apidocs/index.html" title="Javadocs">Javadoc</a></li></ul><h3>Générateur de code</h3><p>Un plugin nommé <a target="_self" href="jsp/site/Portal.jsp?page=codewizard">codewizard</a> vous permet de générer très rapidement certaines parties de code assez fastidieuses : classes métier, DAO et même des classes JUnit.</p><h3>Analyseurs de code</h3><p>Plusieurs outils libres et gratuit, tels que PMD et CheckStyle, permettent de vérifier le respect d''un certain nombre de règles de l''art. Vous trouverez ci-dessous les fichiers de configuration pour ces outils et ci contre leurs sites officiels.</p>');
INSERT INTO html_portlet (id_portlet, html) VALUES (65,'<table><tbody><tr><td rowspan="2" width="10"></td><td rowspan="2"><a target="_blank" href="http://jakarta.apache.org/"><img src="http://demolutece.adullact.org:8080/demolutece/images/local/data/links/apache.gif" border="0" /></a></td><td><a target="_blank" href="http://jakarta.apache.org/">Apache Jakarta</a></td></tr><tr><td><small>Projets Jakarta</small></td></tr><tr><td colspan="2" height="5"></td></tr><tr><td rowspan="2" width="10"></td><td rowspan="2"><a target="_blank" href="http://www.mysql.com/"><img src="http://demolutece.adullact.org:8080/demolutece/images/local/data/links/mysql.png" border="0" /></a></td><td><a target="_blank" href="http://www.mysql.com/">MySQL</a></td></tr><tr><td><small>Site officiel de MySQL</small></td></tr><tr><td colspan="2" height="5"></td></tr><tr><td rowspan="2" width="10"></td><td rowspan="2"><a target="_blank" href="http://pmd.sourceforge.net/"><img src="http://demolutece.adullact.org:8080/demolutece/images/local/data/links/pmd.jpg" border="0" /></a></td><td><a target="_blank" href="http://pmd.sourceforge.net/">PMD</a></td></tr><tr><td><small>Site officiel de l''outil d''analyse de code PMD</small></td></tr><tr><td colspan="2" height="5"></td></tr><tr><td rowspan="2" width="10"></td><td rowspan="2"><a target="_blank" href="http://checkstyle.sourceforge.net/"><img src="http://demolutece.adullact.org:8080/demolutece/images/local/data/links/checkstyle.png" border="0" /></a></td><td><a target="_blank" href="http://checkstyle.sourceforge.net/">CheckStyle</a></td></tr><tr><td><small>Site officiel de l''outil CheckStyle</small></td></tr></tbody></table>­');
INSERT INTO html_portlet (id_portlet, html) VALUES (66,'<a href="jsp/site/Portal.jsp?page=xmlpage&amp;xmlpage=coverage-core&amp;style=html">Mesure de la couverture des tests unitaires du noyau</a>­');
INSERT INTO html_portlet (id_portlet, html) VALUES (90,'<ul><li>  <a href="app/contact">Contact</a></li> <li> <a href="app/digglike">DiggLike</a> </li></ul>');
INSERT INTO html_portlet (id_portlet, html) VALUES (91,'<form method="post" action="jsp/admin/DoAdminLogin.jsp"><h3>Connexion au back office :</h3><div><input name="access_code" id="access_code_admin" value="admin" type="radio" checked="checked" title="administrateur" /> <label for="access_code_admin">Administrateur technique</label></div><div><input name="access_code" id="access_code_webmaster" value="lutece" type="radio" title="webmaster" /> <label for="access_code_webmaster">Webmaster- Gestion de contenu</label></div><div><input name="access_code" id="access_code_redac" value="redac" type="radio" title="redacteur" /> <label for="access_code_redac">Rédacteur -Producteur de contenu</label></div><div><input name="password" value="adminadmin" type="hidden" /></div><br /><input class="-lutece-input -lutece-border-radius-mini" type="submit" /></form>');
INSERT INTO html_portlet (id_portlet, html) VALUES (92,'<div class="-lutece-center -lutece-800px-width">&nbsp; <div id="albumLuteceGalleryViewPanelOnly" class="galleryview"><div class="panel"><img src="document?id=21" title="Paris.fr" alt="Paris.fr"><div class="panel-overlay">Le site de la <a href="http://www.paris.fr/" target="_blank">mairie de Paris</a></div></div><div class="panel"><img src="document?id=14" title="M&eacute;t&eacute;o France" alt="M&eacute;t&eacute;o France"><div class="panel-overlay"><a href="http://france.meteofrance.com/" target="_blank">M&eacute;t&eacute;o France</a></div></div><div class="panel"><img src="document?id=19" title="D&eacute;mat&eacute;rialisation de la s&eacute;ance du conseil de Paris" alt="D&eacute;mat&eacute;rialisation de la s&eacute;ance du conseil de Paris"><div class="panel-overlay"><a href="http://dev.lutece.paris.fr/plugins/plugin-ods/fr/" target="_blank">Outil de d&eacute;mat&eacute;rialisation des documents de s&eacute;ance de conseil</a> (municipal ou g&eacute;n&eacute;ral)</div></div><div class="panel"><img src="document?id=12" title="Marseille" alt="Marseille"><div class="panel-overlay"><a href="http://www.marseille.fr/" target="_blank">La Mairie de Marseille</a></div></div><div class="panel"><img src="document?id=11" title="Mairie 11" alt="Mairie 11"><div class="panel-overlay"><a href="http://mairie02.paris.fr/" target="_blank">Les mairie d''arrondissement</a> &agrave; Paris</div></div><div class="panel"><img src="document?id=16" title="Les t&eacute;l&eacute; proc&eacute;dures de la ville de Marseille www.marseilleservices.fr" alt="Les t&eacute;l&eacute; proc&eacute;dures de la ville de Marseille www.marseilleservices.fr"><div class="panel-overlay">Les <a href="http://www.marseilleservices.fr/" target="_blank">t&eacute;l&eacute; proc&eacute;dures de la ville de Marseille</a></div></div><div class="panel"><img src="document?id=15" title="Eau de Paris, une eau &eacute;conomique, &eacute;cologique et &eacute;quilibr&eacute;e." alt="Eau de Paris, une eau &eacute;conomique, &eacute;cologique et &eacute;quilibr&eacute;e."><div class="panel-overlay"><a href="http://www.eaudeparis.fr" target="_blank">Eau de Paris</a></div></div><div class="panel"><img src="document?id=13" title="Thalys card" alt="Thalys card"><div class="panel-overlay"><a href="https://www.thalysthecard.com/" target="_blank">Thalys card</a></div></div><div class="panel"><img src="document?id=17" title="www.notaires.fr" alt="www.notaires.fr"><div class="panel-overlay"><a href="http://www.notaires.fr/" target="_blank">www.notaires.fr</a></div></div><div class="panel"><img src="document?id=9" title="Bobigny" alt="Bobigny"><div class="panel-overlay">La <a href="http://www.bobigny.fr" target="_blank">mairie de Bobigny</a></div></div><div class="panel"><img src="document?id=20" title="e-bourgogne" alt="e-bourgogne"><div class="panel-overlay"><a href="http://www.e-bourgogne.fr">e-bourgogne</a></div></div></div></div><div class="clear">&nbsp;</div><div class="-lutece-float-right"><em>Voir aussi la <a href="http://fr.lutece.paris.fr/fr/jsp/site/Portal.jsp?page_id=32">page de r&eacute;f&eacute;rences des sites Lut&egrave;ce</a></em></div><div class="clear">&nbsp;</div>');
INSERT INTO html_portlet (id_portlet, html) VALUES (93,'<div style="width: 240px; float: right;"><br />  <img src="http://maps.google.com/staticmap?center=48.8387903,2.3764864&amp;zoom=13&amp;size=240x190&amp;markers=48.8387903,2.3764864&amp;maptype=mobile&amp;key=ABQIAAAA4vLBK6gLTPWM4SKPGrbrARQc5q5fGzHjHDWPODe1_-yJ7grBdxRz7YYWRho6-sdfERCWgEWm4X3eVA&amp;sensor=false" alt="GoogleMap integration example!" /><br /></div>Cette carte a été insérée à l''aide de le fonctionnalité d''insertion dynamique de contenu (linkservice).<br /><br /> Cette fonctionnalité permet d''insérer du contenu interne à Lutece (image, video, contenu éditorial) ou externe comme des cartes google et des vidéos youtube. <br /><br /> Pour plus d''explication sur la façon de procéder, <a href="jsp/site/Portal.jsp?page_id=6">consultez cette page</a>.<br />Ajoutez ensuite toute sorte de contenu en vous connectant via le formulaire ci dessus.<br /> Intéressé ? <br />Découvrez quelques uns de nos <a href="jsp/site/Portal.jsp?page_id=11">modules complémentaires</a> (appelés plugins).<br />');
INSERT INTO html_portlet (id_portlet, html) VALUES (95,'<h2>Ajouter du contenu dans Lutece</h2><div>Lutece vous permet d''ajouter du contenu dans vos pages de plusieurs manières : <br /><ol> <li>par un éditeur de texte riche. Vous pouvez éditer vos pages comme si vous étiez dans Word©</li><li>par un éditeur html/css/javascript. Vous pouvez éditer  directement le code source de vos pages.</li></ol><p>Quelle que soit la méthode que vous choisissez, vous avez un fonctionnalité d''insertion dynamique de contenu (linkservice) qui vous permets d''ajouter des contenus riches provenant d''autres sources. Vous pouvez ainsi ajouter : <br /><ol>  <li>des videos YouTube</li> <li>des google maps</li> <li>des liens vers des applications métiers disponibles dans Lutece</li> <li>des medias (pdf, video, images, document) depuis la médiathèque interne à Lutece</li> <li>des galeries d''images Web 2.0 comme sur la page d''accueil</li></ol></div><br />');
INSERT INTO html_portlet (id_portlet, html) VALUES (96,'<p>Le formulaire sur la colonne de gauche est un exemple de formulaire généré en quelques clics par le <a href="http://dev.lutece.paris.fr/plugins/plugin-form/fr/index.html" target="_blank">plugin-form</a>.</p><p>Simples et intuitifs à créer, les formulaires créés avec le <a href="http://dev.lutece.paris.fr/plugins/plugin-form/fr/index.html" target="_blank">plugin-form</a> sont une solution adaptée pour interagir avec vos utilisateurs.</p><p>Configurable, le <a href="http://dev.lutece.paris.fr/plugins/plugin-form/fr/index.html" target="_blank">plugin-form</a> permet de paramétrer ce que voit l''utilisateur après validation du formulaire. Les résultats du formulaire sous forme d''histogramme ou de camenbert ?<br />A vous de choisir !</p><p>Les résultats sont ensuite exportables au format Excel et Xml.</p><p>Vous voulez plus d''interactivité encore ?<br />Peut-être que le <a href="jsp/site/Portal.jsp?page=digg&amp;id_digg=1">plugin-digg</a> ou le <a href="jsp/site/Portal.jsp?page=calendar">plugin-calendar</a> répondront à vos attentes.</p>');
INSERT INTO html_portlet (id_portlet, html) VALUES (97,'<p>Un plugin nommé <a href="jsp/site/Portal.jsp?page=codewizard">codewizard</a> vous permet de générer très rapidement certaines parties de code assez fastidieuses : classes métier, DAO et même des classes JUnit.</p><br />');
